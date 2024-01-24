**load_data.sh:**
- Installs Algolia CLI for 64-bit Linux
- Prompts for admin API key, which can be found under https://dashboard.algolia.com/account/api-keys/all
- Generates ndjson file from original import file
- Indexes content via Algolia CLI
- DevBox for load data script: https://codesandbox.io/p/github/ParryLuke/algolia/main?workspaceId=e949b036-964e-45fa-88fe-f0b1ed33ffa4

**'expected algolia payload.json':**
- Original import file
- Shouldn't usually be committed, only for exercise purposes

**ui/:**
- Contains UI code for e-commerce example, you can use the following SandBox for testing:
- SandBox for UI: https://codesandbox.io/p/sandbox/example-react-instantsearch-e-commerce-mn7wz3?file=%2FApp.tsx%3A154%2C1-155%2C1
