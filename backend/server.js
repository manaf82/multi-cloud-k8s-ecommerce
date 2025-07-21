const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3001;

// CORS configuration - مهم جداً!
const corsOptions = {
  origin: ['http://localhost:3000', 'http://127.0.0.1:3000'],
  credentials: true,
  optionsSuccessStatus: 200
};

app.use(cors(corsOptions));
app.use(express.json());

// Add logging middleware
app.use((req, res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.path}`);
  next();
});

// Simple health check
app.get('/api/health', (req, res) => {
  console.log('Health check requested');
  res.json({ 
    status: 'healthy', 
    timestamp: new Date().toISOString(),
    version: '1.0.0',
    message: 'Backend is working!'
  });
});

// Get products
app.get('/api/products', (req, res) => {
  console.log('Products requested');
  const products = [
    { 
      id: 1, 
      name: 'MacBook Pro M3', 
      price: 2499.99, 
      category: 'Electronics',
      description: 'Latest MacBook Pro with M3 chip' 
    },
    { 
      id: 2, 
      name: 'Premium Coffee Mug', 
      price: 24.99, 
      category: 'Home & Kitchen',
      description: 'Premium ceramic coffee mug' 
    },
    { 
      id: 3, 
      name: 'Cloud Computing Guide', 
      price: 49.99, 
      category: 'Education',
      description: 'Complete guide to cloud technologies'
    }
  ];
  
  res.json({
    success: true,
    data: products,
    total: products.length
  });
});

// Create order
app.post('/api/orders', (req, res) => {
  console.log('Order received:', req.body);
  const { productId, quantity, customerName, customerEmail } = req.body;
  
  if (!productId || !quantity || !customerName || !customerEmail) {
    return res.status(400).json({
      success: false,
      message: 'Missing required fields'
    });
  }
  
  const order = {
    orderId: `ORD-${Date.now()}`,
    productId: parseInt(productId),
    quantity: parseInt(quantity),
    customerName,
    customerEmail,
    status: 'confirmed',
    orderDate: new Date().toISOString()
  };
  
  res.status(201).json({
    success: true,
    message: 'Order created successfully',
    data: order
  });
});

// Error handling
app.use((err, req, res, next) => {
  console.error('Error:', err);
  res.status(500).json({
    success: false,
    message: 'Internal server error'
  });
});

// Start server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Server running on http://0.0.0.0:${PORT}`);
  console.log(`📊 Health: http://localhost:${PORT}/api/health`);
  console.log(`🛒 Products: http://localhost:${PORT}/api/products`);
});

module.exports = app;