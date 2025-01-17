# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application code into the container
COPY hello.py .

# Command to run the application
CMD ["python", "hello.py"]
