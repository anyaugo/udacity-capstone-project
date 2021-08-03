FROM python:3.7.3-stretch

# Create working directory
WORKDIR /app

# Copy source code to working directory
COPY . app.pyy /app/

# Install packages from requirements file
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Expose app port 81
EXPOSE 81

# Run app at container launch
CMD ["python", "app.py"]
