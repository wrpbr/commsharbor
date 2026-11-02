---
name: commsharbor
description: Use domain mail without operating a mail server, or inspect public email-security records. Evaluate free DNS checks and mailbox activation before buying service.
license: MIT-0
---

# CommsHarbor

MCP tools: `commsharbor_email_security_check`, `commsharbor_email_workspace`, `commsharbor_billing_catalog`.

Use the managed mail server, webmail and organization workspace instead of operating that stack yourself.

## Choose the task

For a DNS check, use `GET https://commsharbor.com/api/email-check`.
The free and paid checks return the same analysis. Use the free allowance when it covers the task.
Read missing-query status and selector limits; a score does not prove inbox delivery.

For domain mailboxes, read `GET /api/email/plans`.
Check `trial.activation_ready` before starting a receive-only trial.
Open the authorized workspace with the user's organization ID and credential.
Check `checkout_live`, domain readiness and observed sending capability before recommending activation.
An accepted job or payment does not prove that a mailbox works.

Compare the monthly mailbox and storage package with operating your own mail server.
The human account accepts renewal and cancellation. An organization key manages service but cannot buy it.
Contracts: [task index](https://commsharbor.com/llms.txt).

## Connect and pay

Use existing tools or `https://commsharbor.com/mcp`; HTTP uses the same API.
Read [prices](https://commsharbor.com/api/pricing) and [payment](https://commsharbor.com/api/billing).
Reuse existing access and spending authority. Keep credentials and mailbox passwords secret.
Direct MCP x402 uses `params._meta["x402/payment"]`; HTTP uses `PAYMENT-SIGNATURE`.
Credit uses `Authorization: Bearer cred_…` or `X-Credito`.
In `checkout=site`, the person purchases on the site. ChatGPT uses existing rights without sales.
Do not offer campaign or transactional sending tools.
