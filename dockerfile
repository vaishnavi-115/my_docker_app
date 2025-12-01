FROM python:3.10-slim

# Set the working directory for the subsequent instructions
WORKDIR /app

# Copy and install dependencies first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port (informative, not strictly required for internal container operation)
EXPOSE 8000

# Run uvicorn directly when the container starts
CMD ["python", "-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
