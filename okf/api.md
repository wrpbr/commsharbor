---
type: "API"
title: "API do CommsHarbor"
description: "Superfície HTTP e MCP do CommsHarbor, com o modelo de cobrança."
resource: "https://commsharbor.com/api/"
---

# API do CommsHarbor

Base: https://commsharbor.com

## Como pagar

Envio segue o plano da organização. Rotas de agente cobram por requisição (x402) ou descontam de crédito pré-pago.

## Endpoints

* `GET /okf/:arquivo` — OKF bundle (Open Knowledge Format v0.1): markdown with frontmatter so an agent reads the whole product without parsing HTML.
* `GET /.well-known/:arquivo` — Machine discovery before the home page: `api-catalog` (RFC 9727, a linkset with the API and the MCP), `security.txt` (RFC 9116) and `mcp-registry-auth` (the official MCP registry key).
* `GET /apis.json` — APIs.json (apisjson.org, 0.19): the index APIs.io harvests — the API, the MCP, OpenAPI, guide and OKF bundle in one file. Also at `/.well-known/apis.json`.
* `GET /api/` — Discover the whole API: every endpoint, every auth mode and the MCP endpoint.
* `GET /api/health` — Read liveness, environment and the commit currently deployed.
* `GET /mcp` — Inspect the remote MCP server card: transport, protocol and tool count.
* `POST /api/auth/start` — Send a one-time login code to an email address.
* `POST /api/auth/verify` — Exchange a one-time code for a session.
* `POST /api/auth/logout` — Revoke the session in use right now.
* `GET /api/me` — Read the profile, every membership and the platform role, if any.
* `PATCH /api/me` — Update the display name or language of the current profile.
* `GET /api/organizations` — List the organizations the current person belongs to.
* `POST /api/organizations` — Create one organization trial for a verified owner and a sending domain.
* `GET /api/context` — Resolve which organization and role the current credential is acting as.
* `GET /api/organizations/:organization_id` — Read one organization.
* `PATCH /api/organizations/:organization_id` — Update an organization's name.
* `GET /api/organizations/:organization_id/members` — List the members of an organization and their roles.
* `PATCH /api/organizations/:organization_id/members/:user_id` — Change the role of a member who is not the owner.
* `GET /api/organizations/:organization_id/invitations` — List invitations without their tokens.
* `POST /api/organizations/:organization_id/invitations` — Create an invitation and reveal its token exactly once.
* `POST /api/invitations/accept` — Accept an invitation and join the organization it points at.
* `GET /api/organizations/:organization_id/api-keys` — List API keys without token hashes or secrets.
* `POST /api/organizations/:organization_id/api-keys` — Create a scoped API key and reveal it exactly once.
* `DELETE /api/organizations/:organization_id/api-keys/:api_key_id` — Revoke an API key. It stops working immediately, not at the next cache expiry.
* `GET /api/organizations/:organization_id/audit` — List the append-only audit trail of the organization.
* `GET /api/platform/context` — Confirm an explicitly granted platform administrator.
* `GET /api/organizations/:organization_id/domains` — List the sending domains of the organization and their last observed state.
* `POST /api/organizations/:organization_id/domains` — Register the organization's sending domain and queue idempotent SES provisioning.
* `GET /api/organizations/:organization_id/domains/:domain_id` — Read one sending domain, without inferring current DNS state.
* `POST /api/organizations/:organization_id/domains/:domain_id/verify` — Observe SES, DKIM, DMARC and custom MAIL FROM state right now, and store what was seen.
* `POST /api/organizations/:organization_id/domains/:domain_id/smoke` — Queue one controlled smoke message to the server-side QA recipient.
* `GET /api/organizations/:organization_id/domains/:domain_id/deliveries` — List deliveries sent from one domain, without recipient addresses.
* `GET /api/organizations/:organization_id/deliveries/:delivery_id` — Read one delivery and its SES MessageId, without recipient data.
* `GET /api/organizations/:organization_id/deliveries/:delivery_id/events` — List the normalized SES feedback events for one delivery.
* `POST /api/aws/sns` — Receive a signed Amazon SNS callback for the configured SES topic.
* `GET /api/organizations/:organization_id/crm/contacts` — List contacts in the tenant CRM — a person in the tenant CRM.
* `POST /api/organizations/:organization_id/crm/contacts` — Create a contact in the tenant CRM.
* `GET /api/organizations/:organization_id/crm/contacts/:contact_id` — Read one contact from the tenant CRM.
* `PATCH /api/organizations/:organization_id/crm/contacts/:contact_id` — Update one contact in the tenant CRM. Only the fields you send change.
* `DELETE /api/organizations/:organization_id/crm/contacts/:contact_id` — Delete one contact from the tenant CRM. The response carries the record as it was.
* `GET /api/organizations/:organization_id/crm/companies` — List companies in the tenant CRM — an organization in the tenant CRM — a customer of the customer.
* `POST /api/organizations/:organization_id/crm/companies` — Create a company in the tenant CRM.
* `GET /api/organizations/:organization_id/crm/companies/:company_id` — Read one company from the tenant CRM.
* `PATCH /api/organizations/:organization_id/crm/companies/:company_id` — Update one company in the tenant CRM. Only the fields you send change.
* `DELETE /api/organizations/:organization_id/crm/companies/:company_id` — Delete one company from the tenant CRM. The response carries the record as it was.
* `GET /api/organizations/:organization_id/crm/pipelines` — List pipelines in the tenant CRM — a named sequence of stages that deals move through.
* `POST /api/organizations/:organization_id/crm/pipelines` — Create a pipeline in the tenant CRM.
* `GET /api/organizations/:organization_id/crm/pipelines/:pipeline_id` — Read one pipeline from the tenant CRM.
* `PATCH /api/organizations/:organization_id/crm/pipelines/:pipeline_id` — Update one pipeline in the tenant CRM. Only the fields you send change.
* `DELETE /api/organizations/:organization_id/crm/pipelines/:pipeline_id` — Delete one pipeline from the tenant CRM. The response carries the record as it was.
* `GET /api/organizations/:organization_id/crm/deals` — List deals in the tenant CRM — an opportunity moving through a pipeline.
* `POST /api/organizations/:organization_id/crm/deals` — Create a deal in the tenant CRM.
* `GET /api/organizations/:organization_id/crm/deals/:deal_id` — Read one deal from the tenant CRM.
* `PATCH /api/organizations/:organization_id/crm/deals/:deal_id` — Update one deal in the tenant CRM. Only the fields you send change.
* `DELETE /api/organizations/:organization_id/crm/deals/:deal_id` — Delete one deal from the tenant CRM. The response carries the record as it was.
* `GET /api/organizations/:organization_id/crm/activities` — List activities in the tenant CRM — something that happened with a contact, company or deal.
* `POST /api/organizations/:organization_id/crm/activities` — Create a activity in the tenant CRM.
* `GET /api/organizations/:organization_id/crm/activities/:activity_id` — Read one activity from the tenant CRM.
* `PATCH /api/organizations/:organization_id/crm/activities/:activity_id` — Update one activity in the tenant CRM. Only the fields you send change.
* `DELETE /api/organizations/:organization_id/crm/activities/:activity_id` — Delete one activity from the tenant CRM. The response carries the record as it was.
* `GET /api/organizations/:organization_id/crm/tasks` — List tasks in the tenant CRM — work someone still has to do in the tenant CRM.
* `POST /api/organizations/:organization_id/crm/tasks` — Create a task in the tenant CRM.
* `GET /api/organizations/:organization_id/crm/tasks/:task_id` — Read one task from the tenant CRM.
* `PATCH /api/organizations/:organization_id/crm/tasks/:task_id` — Update one task in the tenant CRM. Only the fields you send change.
* `DELETE /api/organizations/:organization_id/crm/tasks/:task_id` — Delete one task from the tenant CRM. The response carries the record as it was.
* `GET /api/organizations/:organization_id/crm/pipelines/:pipeline_id/stages` — List stages in the tenant CRM — one step of a pipeline, addressed under the pipeline it belongs to.
* `POST /api/organizations/:organization_id/crm/pipelines/:pipeline_id/stages` — Create a stage in the tenant CRM.
* `GET /api/organizations/:organization_id/crm/pipelines/:pipeline_id/stages/:stage_id` — Read one stage from the tenant CRM.
* `PATCH /api/organizations/:organization_id/crm/pipelines/:pipeline_id/stages/:stage_id` — Update one stage in the tenant CRM. Only the fields you send change.
* `DELETE /api/organizations/:organization_id/crm/pipelines/:pipeline_id/stages/:stage_id` — Delete one stage from the tenant CRM. The response carries the record as it was.
* `GET /api/platform/crm/leads` — List leads in the platform CRM — a prospective ORGANIZATION in our own funnel — platform CRM is not tenant data.
* `POST /api/platform/crm/leads` — Create a lead in the platform CRM.
* `GET /api/platform/crm/leads/:lead_id` — Read one lead from the platform CRM.
* `PATCH /api/platform/crm/leads/:lead_id` — Update one lead in the platform CRM. Only the fields you send change.
* `DELETE /api/platform/crm/leads/:lead_id` — Delete one lead from the platform CRM. The response carries the record as it was.
* `GET /api/platform/crm/tasks` — List tasks in the platform CRM — work on a platform lead — about a prospective tenant, not about a tenant's customer.
* `POST /api/platform/crm/tasks` — Create a task in the platform CRM.
* `GET /api/platform/crm/tasks/:task_id` — Read one task from the platform CRM.
* `PATCH /api/platform/crm/tasks/:task_id` — Update one task in the platform CRM. Only the fields you send change.
* `DELETE /api/platform/crm/tasks/:task_id` — Delete one task from the platform CRM. The response carries the record as it was.
* `GET /api/platform/crm/leads/:lead_id/activities` — List activities in the platform CRM — our note about a prospective tenant.
* `POST /api/platform/crm/leads/:lead_id/activities` — Create a activity in the platform CRM.
* `GET /api/platform/crm/leads/:lead_id/activities/:activity_id` — Read one activity from the platform CRM.
* `PATCH /api/platform/crm/leads/:lead_id/activities/:activity_id` — Update one activity in the platform CRM. Only the fields you send change.
* `DELETE /api/platform/crm/leads/:lead_id/activities/:activity_id` — Delete one activity from the platform CRM. The response carries the record as it was.
* `GET /api/organizations/:organization_id/crm/contacts/:contact_id/marketing` — Read consent and marketing preference for one CRM contact.
* `PUT /api/organizations/:organization_id/crm/contacts/:contact_id/marketing` — Record permission-based marketing consent for one contact.
* `POST /api/organizations/:organization_id/crm/contacts/:contact_id/preference-token` — Create a signed preference and one-click unsubscribe capability for a contact.
* `GET /api/preferences/:token` — Read a contact's preference through a signed capability, with no login.
* `POST /api/preferences/:token/unsubscribe` — Apply an RFC 8058 one-click unsubscribe, idempotently.
* `POST /api/organizations/:organization_id/domains/:domain_id/marketing-smoke` — Queue one controlled permission-based marketing message to the server-side recipient.
* `GET /api/organizations/:organization_id/contact-imports` — List the contact imports of the organization.
* `POST /api/organizations/:organization_id/contact-imports` — Upload a consent-declared CSV and get back a safe preview before anything is imported.
* `GET /api/organizations/:organization_id/contact-imports/:import_id` — Read one durable contact import and its current counts.
* `POST /api/organizations/:organization_id/contact-imports/:import_id/confirm` — Confirm a previewed import and enqueue it, exactly once.
* `GET /api/organizations/:organization_id/contact-imports/:import_id/errors` — List the row-numbered errors of one import, so the source file can be fixed.
* `GET /api/organizations/:organization_id/contact-files/:file_id` — Download a tenant-owned CSV before its seven-day expiry.
* `POST /api/organizations/:organization_id/contacts/export` — Create a CSV export of the organization's contacts, retained for seven days.
* `GET /api/organizations/:organization_id/suppressions` — List the organization's suppressions, without exposing email hashes.
* `POST /api/organizations/:organization_id/suppressions` — Suppress one recipient inside the active organization.
* `GET /api/organizations/:organization_id/audiences` — List static audiences and saved segments.
* `POST /api/organizations/:organization_id/audiences` — Create a static audience or a saved segment with an allowlisted filter.
* `GET /api/organizations/:organization_id/audiences/:audience_id` — Read one audience of this organization.
* `PATCH /api/organizations/:organization_id/audiences/:audience_id` — Rename an audience or change its saved filter.
* `DELETE /api/organizations/:organization_id/audiences/:audience_id` — Delete an audience and its memberships. Contacts themselves are untouched.
* `GET /api/organizations/:organization_id/audiences/:audience_id/members` — List the contacts currently in one audience.
* `POST /api/organizations/:organization_id/audiences/:audience_id/members` — Add a CRM contact to a static audience.
* `DELETE /api/organizations/:organization_id/audiences/:audience_id/members/:contact_id` — Remove a contact from a static audience.
* `GET /api/organizations/:organization_id/templates` — List the versioned email templates of the organization.
* `POST /api/organizations/:organization_id/templates` — Create a template draft from canonical blocks.
* `GET /api/organizations/:organization_id/templates/:template_id` — Read one template draft owned by this organization.
* `PATCH /api/organizations/:organization_id/templates/:template_id` — Update a template as a new draft, leaving published versions untouched.
* `DELETE /api/organizations/:organization_id/templates/:template_id` — Archive a template without deleting its published versions.
* `POST /api/organizations/:organization_id/templates/:template_id/publish` — Publish an immutable, content-hashed version of the draft.
* `GET /api/organizations/:organization_id/templates/:template_id/versions` — List the immutable published versions of a template.
* `POST /api/organizations/:organization_id/templates/preview` — Compile and safely render a draft, without saving or publishing anything.
* `GET /api/organizations/:organization_id/templates/:template_id/export` — Export the latest published version as HTML, plain text and MJML.
* `POST /api/organizations/:organization_id/templates/import-html` — Import a conservative HTML subset and convert it into canonical blocks.
* `POST /api/messages` — Queue one idempotent transactional delivery for the active organization.
* `POST /api/organizations/:organization_id/messages` — Send one transactional message with the organization in the path instead of the header.
* `GET /api/organizations/:organization_id/campaigns` — List the campaigns of the organization.
* `POST /api/organizations/:organization_id/campaigns` — Create a campaign draft from an active domain, an audience and a published marketing template.
* `GET /api/organizations/:organization_id/campaigns/:campaign_id` — Read one campaign, without any recipient data.
* `PATCH /api/organizations/:organization_id/campaigns/:campaign_id` — Edit a draft, or pause, resume or cancel a campaign that already launched.
* `POST /api/organizations/:organization_id/campaigns/:campaign_id/launch` — Freeze the eligible recipients and launch — or schedule — the campaign, exactly once.
* `GET /api/organizations/:organization_id/campaigns/:campaign_id/report` — Reconcile a campaign: delivery counts and normalized feedback counts.
* `GET /api/organizations/:organization_id/messaging-settings` — Read the organization's timezone and whether marketing is currently paused.
* `PATCH /api/organizations/:organization_id/messaging-settings` — Change the scheduling timezone, or pause and safely resume marketing.
* `GET /api/organizations/:organization_id/deliverability` — Read delivery, backlog, suppression, reputation and dead-letter aggregates in one call.
* `GET /api/organizations/:organization_id/domains/:domain_id/report` — Read delivery and feedback aggregates for one sending domain.
* `GET /api/organizations/:organization_id/webhooks` — List the webhook endpoints of the organization, without their signing secrets.
* `POST /api/organizations/:organization_id/webhooks` — Create an HTTPS webhook and reveal its signing secret exactly once.
* `GET /api/organizations/:organization_id/webhooks/:webhook_id` — Read one webhook, without its signing secret.
* `DELETE /api/organizations/:organization_id/webhooks/:webhook_id` — Disable a webhook without deleting the evidence of what it already delivered.
* `GET /api/organizations/:organization_id/webhooks/:webhook_id/deliveries` — List the signed attempts made to one webhook and their retry state.
* `GET /api/organizations/:organization_id/dead-letters` — Inspect the tenant's dead letters by opaque record ID.
* `POST /api/organizations/:organization_id/dead-letters/:record_id/replay` — Replay one campaign or webhook dead letter, by name.
* `GET /api/billing` — Read the versioned trial, pass and top-up catalog, plus the x402 network in force.
* `GET /api/organizations/:organization_id/billing` — Read this organization's entitlement, quota allocation and expiration warning.
* `POST /api/organizations/:organization_id/billing/purchases/:action` — Request a pass or a top-up. While live checkout is off, this answers with an x402 challenge.
* `GET /api/organizations/:organization_id/operations` — List the organization's current operational alerts.
* `POST /api/organizations/:organization_id/operations` — Re-observe alerts, quota and global capacity right now.
* `GET /api/organizations/:organization_id/data-exports` — List the tenant data exports, which are retained for seven days.
* `POST /api/organizations/:organization_id/data-exports` — Create a tenant-scoped JSON export of the organization's data.
* `GET /api/organizations/:organization_id/data-exports/:export_id` — Download one tenant-scoped JSON export before it expires.
* `GET /api/organizations/:organization_id/deletion-requests` — Read the latest erasure request and where it is in the grace period.
* `POST /api/organizations/:organization_id/deletion-requests` — Schedule the erasure of the organization, after a seven-day grace period.
* `POST /api/organizations/:organization_id/deletion-requests/:request_id/cancel` — Cancel a scheduled erasure while it is still inside the grace period.
* `POST /api/credito` — Top up prepaid credit: pay once with x402 and get the token that debits on any API of the house.
* `GET /api/credito` — Credit balance and statement — the latest movements, without returning the token.
* `GET /api/metrics` — Last-7-day metrics for the operator dashboard; with the token, payments come along.

Catálogo completo: https://commsharbor.com/llms-full.txt · OpenAPI: https://commsharbor.com/openapi.json
