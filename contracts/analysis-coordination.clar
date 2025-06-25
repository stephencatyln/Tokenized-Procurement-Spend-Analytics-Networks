;; Analysis Coordination Contract
;; Coordinates spend analysis activities

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u300))
(define-constant ERR_ANALYSIS_NOT_FOUND (err u301))
(define-constant ERR_INVALID_STATUS (err u302))

;; Analysis status constants
(define-constant STATUS_PENDING u1)
(define-constant STATUS_IN_PROGRESS u2)
(define-constant STATUS_COMPLETED u3)
(define-constant STATUS_CANCELLED u4)

;; Data structures
(define-map analysis-tasks uint {
    title: (string-ascii 100),
    assigned-analyst: principal,
    status: uint,
    created-date: uint,
    completion-date: (optional uint),
    priority: uint
})

(define-map analyst-workload principal uint)
(define-data-var next-analysis-id uint u1)

;; Public functions
(define-public (create-analysis-task (title (string-ascii 100)) (analyst principal) (priority uint))
    (let ((analysis-id (var-get next-analysis-id)))
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (map-set analysis-tasks analysis-id {
            title: title,
            assigned-analyst: analyst,
            status: STATUS_PENDING,
            created-date: block-height,
            completion-date: none,
            priority: priority
        })
        (map-set analyst-workload analyst
            (+ (default-to u0 (map-get? analyst-workload analyst)) u1))
        (var-set next-analysis-id (+ analysis-id u1))
        (ok analysis-id)
    )
)

(define-public (update-analysis-status (analysis-id uint) (new-status uint))
    (let ((task (unwrap! (map-get? analysis-tasks analysis-id) ERR_ANALYSIS_NOT_FOUND)))
        (asserts! (or (is-eq tx-sender CONTRACT_OWNER)
                     (is-eq tx-sender (get assigned-analyst task))) ERR_UNAUTHORIZED)
        (asserts! (<= new-status STATUS_CANCELLED) ERR_INVALID_STATUS)
        (map-set analysis-tasks analysis-id (merge task {
            status: new-status,
            completion-date: (if (is-eq new-status STATUS_COMPLETED)
                               (some block-height)
                               (get completion-date task))
        }))
        (ok true)
    )
)

;; Read-only functions
(define-read-only (get-analysis-task (analysis-id uint))
    (map-get? analysis-tasks analysis-id)
)

(define-read-only (get-analyst-workload (analyst principal))
    (default-to u0 (map-get? analyst-workload analyst))
)
