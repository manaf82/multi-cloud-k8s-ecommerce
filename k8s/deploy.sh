#!/bin/bash

echo "🚀 Starting Multi-Cloud E-commerce Deployment..."

# Build Docker images
echo "📦 Building Docker images..."
docker-compose build

# Apply Kubernetes manifests
echo "☸️  Applying Kubernetes manifests..."
kubectl apply -f namespace.yaml
kubectl apply -f postgres.yaml
kubectl apply -f backend.yaml
kubectl apply -f frontend.yaml
kubectl apply -f ingress.yaml

# Wait for deployments
echo "⏳ Waiting for deployments to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/postgres -n ecommerce
kubectl wait --for=condition=available --timeout=300s deployment/backend -n ecommerce
kubectl wait --for=condition=available --timeout=300s deployment/frontend -n ecommerce

# Show status
echo "📊 Deployment Status:"
kubectl get pods -n ecommerce
kubectl get services -n ecommerce

echo "✅ Deployment Complete!"
echo "🌐 Access your application at: http://ecommerce.local"
