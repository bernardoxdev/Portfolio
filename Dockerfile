FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=backend/main.py
ENV FLASK_ENV=production
ENV PYTHONPATH=/app

EXPOSE 5173

CMD ["gunicorn", "-b", "0.0.0.0:5000", "backend.main:app"]