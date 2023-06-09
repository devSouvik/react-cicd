# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install project dependencies
RUN npm ci --quiet

# Copy the entire project to the container
COPY . .

# Build the React app
RUN npm run build

# Set the environment variable for serving the app
ENV NODE_ENV=production

# Expose the port on which the app will run
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
