FROM python:3.8-slim

RUN apt-get update

# Copy local files to docker image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Upgrade pip
RUN pip install --upgrade pip

# Install dependencies
RUN pip install -r requirements.txt

# Expose port
EXPOSE 8080

# Run the app.
CMD ["streamlit", "run", "--server.headless=true", "--server.port=8080", "app.py"]
