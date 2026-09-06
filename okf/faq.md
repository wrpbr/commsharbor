---
type: "FAQ"
title: "FAQ — CommsHarbor"
description: "Perguntas e respostas sobre o CommsHarbor, as mesmas publicadas na página."
resource: "https://commsharbor.com/"
---

# Perguntas frequentes — CommsHarbor

## Can I sign up today?

Access is invite-only. Sign in at the workspace with a one-time e-mail code; a verified owner opens one 30-day organization trial for one sending domain, and invited members inherit it. To ask for an organization, write to contato@commsharbor.com with your sending domain.

## What does the trial include?

Thirty days, one sending domain verified against SES and DNS, 1,000 contacts and 5,000 sends — transactional messages, permission-based campaigns, webhooks, scoped API keys, the audit trail and the tenant CRM. It is free and does not renew by itself.

## Why does a purchase return 402?

Live checkout is off. The pass (US$ 15 for 30 days) and the top-up (US$ 10 for 10,000 sends) are in the public catalog at /api/billing, but while checkout_live is false a purchase answers with a standard x402 challenge and nobody is charged. A platform cap of 1,000 real recipients a month prevails over anything a tenant bought.

## How is a transactional send kept honest?

Every send carries an idempotency key, so a retry never duplicates a message; delivery, bounce and complaint events are tracked per message; failed deliveries land in a dead-letter queue you can replay; and each action is written to an append-only audit with request correlation.

## What keeps a campaign permission-based?

Consent, unsubscribe, suppressions and preferences live in the send path: an audience is resolved against them at send time, so a campaign cannot reach someone who opted out, and the suppression list is shared by transactional and marketing sends.

## Can an agent operate it?

Yes. Every human action in the workspace has an HTTP endpoint and an MCP tool, resources carry absolute links, and scoped API keys limit what an agent can do inside one organization. The public /api/, /llms.txt and /openapi.json describe all of it.
