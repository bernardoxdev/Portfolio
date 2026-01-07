FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY . /app

RUN if [ -f backend/requirements.txt ]; then \
        pip install --no-cache-dir -r backend/requirements.txt ; \
    fi

EXPOSE 5000

CMD ["python", "backend/main.py"]
