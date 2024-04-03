# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the Flask application script into the container at /app
COPY . /app

# Install Flask and other dependencies
RUN pip install --no-cache-dir Flask

# Expose the port the app runs on
EXPOSE 5000

# Define the command to run the application when the container starts
CMD ["python", "app.py"]