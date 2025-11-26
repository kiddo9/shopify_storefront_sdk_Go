#!/bin/bash

# Load environment variables from .env file
set -a
source .env
set +a

echo "🔄 Downloading Shopify Storefront Schema..."
curl -s -H "X-Shopify-Storefront-Access-Token: ${SHOPIFY_STOREFRONT_TOKEN}" \
     https://${SHOPIFY_STORE_DOMAIN}/api/2025-01/graphql.json \
     -o schema.json

echo "📘 Running GraphQL Codegen..."
npx graphql-codegen --config codegen.yml

echo "✅ Codegen complete → src/generated/shopify.ts"