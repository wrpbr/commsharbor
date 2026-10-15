# CommsHarbor MCP server

CommsHarbor provides email for your domain, with webmail, IMAP and SMTP. Its remote MCP server helps an assistant
read the email workspace, prepare domain setup, check DNS verification, and manage authorized mailboxes and aliases.
This repository contains the connection settings and a user skill. The hosted service runs at
[commsharbor.com](https://commsharbor.com).

## Configure

The server uses Streamable HTTP. No local program is required. Add this to `.vscode/mcp.json` for GitHub Copilot
in VS Code:

```json
{
  "servers": {
    "commsharbor": {
      "type": "http",
      "url": "https://commsharbor.com/mcp?checkout=site"
    }
  }
}
```

For Cursor, use the same entry under `mcpServers` in `.cursor/mcp.json`. For other clients, select an HTTP server
and enter the URL above. The official registry entry is `com.commsharbor/commsharbor`.

## Use

Start with: "Show the available CommsHarbor email plans."

- `commsharbor_email_plans` reads the public plans and storage allowances.
- `commsharbor_email_workspace` reads an authorized organization's workspace.
- `commsharbor_email_domain_setup` checks a domain before purchase without creating a charge.
- Other authorized tools create mailboxes and aliases, verify domains and read setup jobs.

Public discovery requires no account. Workspace operations require organization access. Use an organization API
key through the client's secret storage and the `X-Api-Key` header. Supply the `organization_id` requested by the
tool. Never commit a key to the client configuration. Read the [API contract](https://commsharbor.com/openapi.json)
for each tool's required fields and permissions.

## Access and cost

Create the account and select the email service on the website. The receive-only trial and sending plans have
different permissions. The connection above disables payment transactions through the assistant. Mailbox passwords
and message content are not returned by workspace reads. Campaigns and transactional sending APIs are not part of
the current offer.

## Documentation and support

- [Setup and API documentation](https://commsharbor.com/developers)
- [Agent reference](https://commsharbor.com/llms.txt)

Send support requests to contato@commsharbor.com or open an issue here. The files in this repository use the MIT-0
license. The hosted service has separate terms. Its source code is not included.
