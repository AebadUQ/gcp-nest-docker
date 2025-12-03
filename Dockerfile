# -------- BUILDER --------
FROM node:18 AS builder
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy entire project
COPY . .

# GENERATE PRISMA CLIENT
RUN npx prisma generate

# Build NestJS
RUN npm run build


# -------- RUNNER --------
FROM node:18
WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

# Copy dist + prisma folder + generated client
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma

EXPOSE 3000

CMD ["node", "dist/main.js"]
