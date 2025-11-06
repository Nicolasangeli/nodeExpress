# Use the official Node.js image as the base image 
FROM node:18 

# Set the working directory in the container 
WORKDIR /main 

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

EXPOSE 3000 

# Define the entry point for the container 
CMD ["npm", "start"]
