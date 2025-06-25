# Tokenized Procurement Spend Analytics Networks

A comprehensive blockchain-based system for managing procurement spend analytics using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a decentralized approach to procurement spend management through five interconnected smart contracts:

- **Spend Analyst Verification**: Validates and manages procurement spend analysts
- **Spend Categorization**: Categorizes and tracks procurement spend data
- **Analysis Coordination**: Coordinates spend analysis activities and workload
- **Savings Identification**: Identifies and tracks cost savings opportunities
- **Optimization Planning**: Plans and manages spend optimization strategies

## Features

### 🔐 Analyst Verification
- Verify procurement analysts with certification levels
- Track experience and credentials
- Revoke verification when necessary
- Secure authorization controls

### 📊 Spend Categorization
- Create custom spending categories with risk levels
- Categorize procurement spend by vendor and amount
- Track categorization history and analyst assignments
- Flexible category management

### 🎯 Analysis Coordination
- Create and assign analysis tasks to verified analysts
- Track task status (pending, in-progress, completed, cancelled)
- Monitor analyst workload distribution
- Priority-based task management

### 💰 Savings Identification
- Identify potential cost savings opportunities
- Track realized vs. potential savings
- Category-based savings analysis
- Comprehensive savings reporting

### 📈 Optimization Planning
- Create comprehensive optimization plans
- Set target savings and timelines
- Milestone tracking and completion
- Strategic planning capabilities

## Smart Contract Architecture

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                    Procurement Analytics Network             │
├─────────────────────────────────────────────────────────────┤
│  Analyst Verification  │  Spend Categorization              │
│  - Verify analysts     │  - Create categories               │
│  - Track credentials   │  - Categorize spend                │
│  - Manage permissions  │  - Track records                   │
├─────────────────────────────────────────────────────────────┤
│  Analysis Coordination │  Savings Identification            │
│  - Assign tasks        │  - Identify opportunities          │
│  - Track progress      │  - Realize savings                 │
│  - Manage workload     │  - Track totals                    │
├─────────────────────────────────────────────────────────────┤
│              Optimization Planning                          │
│              - Create plans                                 │
│              - Set milestones                               │
│              - Track completion                             │
└─────────────────────────────────────────────────────────────┘
\`\`\`

## Getting Started

### Prerequisites
- Stacks blockchain node or testnet access
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd tokenized-procurement-analytics
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to Stacks testnet:

\`\`\`bash
# Deploy analyst verification contract
clarinet deploy --testnet contracts/spend-analyst-verification.clar

# Deploy categorization contract
clarinet deploy --testnet contracts/spend-categorization.clar

# Deploy coordination contract
clarinet deploy --testnet contracts/analysis-coordination.clar

# Deploy savings identification contract
clarinet deploy --testnet contracts/savings-identification.clar

# Deploy optimization planning contract
clarinet deploy --testnet contracts/optimization-planning.clar
\`\`\`

## Usage Examples

### Verify an Analyst
\`\`\`clarity
(contract-call? .spend-analyst-verification verify-analyst
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
u3 ;; certification level
u5 ;; years of experience
)
\`\`\`

### Create Spend Category
\`\`\`clarity
(contract-call? .spend-categorization create-category
"IT Services"
"Information Technology related procurement"
u2 ;; risk level
)
\`\`\`

### Identify Savings Opportunity
\`\`\`clarity
(contract-call? .savings-identification identify-savings-opportunity
"Consolidate cloud vendors"
u100000 ;; potential savings
"IT Services"
)
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run specific contract tests
npm test spend-analyst-verification
npm test spend-categorization
npm test analysis-coordination
npm test savings-identification
npm test optimization-planning
\`\`\`

## Contract Functions

### Spend Analyst Verification
- \`verify-analyst\`: Verify a new analyst
- \`revoke-verification\`: Revoke analyst verification
- \`is-verified-analyst\`: Check verification status
- \`get-analyst-credentials\`: Get analyst details

### Spend Categorization
- \`create-category\`: Create spending category
- \`categorize-spend\`: Categorize procurement spend
- \`get-category\`: Get category details
- \`get-spend-record\`: Get spend record

### Analysis Coordination
- \`create-analysis-task\`: Create new analysis task
- \`update-analysis-status\`: Update task status
- \`get-analysis-task\`: Get task details
- \`get-analyst-workload\`: Get analyst workload

### Savings Identification
- \`identify-savings-opportunity\`: Identify savings
- \`realize-savings\`: Record realized savings
- \`get-savings-opportunity\`: Get opportunity details
- \`get-total-potential-savings\`: Get total potential
- \`get-total-realized-savings\`: Get total realized

### Optimization Planning
- \`create-optimization-plan\`: Create optimization plan
- \`add-milestone\`: Add plan milestone
- \`complete-milestone\`: Mark milestone complete
- \`get-optimization-plan\`: Get plan details
- \`get-milestone\`: Get milestone details

## Security Considerations

- All contracts implement proper authorization checks
- Owner-only functions are protected
- Input validation prevents invalid data
- Error handling provides clear feedback
- No external dependencies reduce attack surface

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or support, please open an issue in the repository or contact the development team.
\`\`\`

## Roadmap

- [ ] Integration with external procurement systems
- [ ] Advanced analytics and reporting
- [ ] Multi-signature approval workflows
- [ ] Integration with DeFi protocols for automated payments
- [ ] Mobile application interface
- [ ] Real-time spend monitoring and alerts

