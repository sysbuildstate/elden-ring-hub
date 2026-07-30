FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY api/package*.json ./api/
RUN npm ci --workspace=api
COPY api ./api
RUN npm run build --workspace=api

FROM node:22-alpine AS production
WORKDIR /app
COPY package*.json ./
COPY api/package*.json ./api/
RUN npm ci --workspace=api --omit=dev
COPY --from=builder /app/api/dist ./api/dist
USER node
EXPOSE 3000
CMD ["node", "api/dist/main"]