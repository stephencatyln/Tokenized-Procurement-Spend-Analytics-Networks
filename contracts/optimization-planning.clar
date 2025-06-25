;; Optimization Planning Contract
;; Plans and manages spend optimization strategies

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u500))
(define-constant ERR_PLAN_NOT_FOUND (err u501))
(define-constant ERR_INVALID_TIMELINE (err u502))

;; Data structures
(define-map optimization-plans uint {
    title: (string-ascii 100),
    description: (string-ascii 300),
    target-savings: uint,
    timeline-blocks: uint,
    created-by: principal,
    status: (string-ascii 20),
    created-date: uint
})

(define-map plan-milestones uint {
    plan-id: uint,
    milestone-name: (string-ascii 100),
    target-date: uint,
    completed: bool
})

(define-data-var next-plan-id uint u1)
(define-data-var next-milestone-id uint u1)

;; Public functions
(define-public (create-optimization-plan
    (title (string-ascii 100))
    (desc (string-ascii 300))
    (target-savings uint)
    (timeline uint))
    (let ((plan-id (var-get next-plan-id)))
        (asserts! (> timeline u0) ERR_INVALID_TIMELINE)
        (map-set optimization-plans plan-id {
            title: title,
            description: desc,
            target-savings: target-savings,
            timeline-blocks: timeline,
            created-by: tx-sender,
            status: "active",
            created-date: block-height
        })
        (var-set next-plan-id (+ plan-id u1))
        (ok plan-id)
    )
)

(define-public (add-milestone
    (plan-id uint)
    (milestone-name (string-ascii 100))
    (target-date uint))
    (let ((milestone-id (var-get next-milestone-id)))
        (asserts! (is-some (map-get? optimization-plans plan-id)) ERR_PLAN_NOT_FOUND)
        (map-set plan-milestones milestone-id {
            plan-id: plan-id,
            milestone-name: milestone-name,
            target-date: target-date,
            completed: false
        })
        (var-set next-milestone-id (+ milestone-id u1))
        (ok milestone-id)
    )
)

(define-public (complete-milestone (milestone-id uint))
    (let ((milestone (unwrap! (map-get? plan-milestones milestone-id) ERR_PLAN_NOT_FOUND)))
        (map-set plan-milestones milestone-id
            (merge milestone { completed: true }))
        (ok true)
    )
)

;; Read-only functions
(define-read-only (get-optimization-plan (plan-id uint))
    (map-get? optimization-plans plan-id)
)

(define-read-only (get-milestone (milestone-id uint))
    (map-get? plan-milestones milestone-id)
)
