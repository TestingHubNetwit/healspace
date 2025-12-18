FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build argument for the API key
ARG GEMINI_API_KEY
ENV GEMINI_API_KEY=$GEMINI_API_KEY

# Build the application
RUN npm run build

# Expose port 3014
EXPOSE 3014

# Start the application using vite preview
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "3014"]
