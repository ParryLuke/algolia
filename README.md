**load_data.sh:**
- Installs Algolia CLI for 64-bit Linux
- Prompts for admin API key, which can be found under https://dashboard.algolia.com/account/api-keys/all
- Generates ndjson file from original import file
- Indexes content via Algolia CLI

**'expected algolia payload.json':**
- Original import file
- Shouldn't usually be committed, only for exercise purposes

**ui/:**
- Contains UI code for e-commerce example
