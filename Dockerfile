# Use the official Node.js image as the build environment
FROM node:14-alpine as build

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Start a new build stage
FROM gcr.io/distroless/nodejs:14

WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app /app

# Specify the command to run your application
CMD ["index.js"]