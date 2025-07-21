-- إنشاء قاعدة البيانات وجداولها
CREATE DATABASE IF NOT EXISTS ecommerce;

-- استخدام قاعدة البيانات
\c ecommerce;

-- إنشاء جدول المنتجات
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100),
    stock INTEGER DEFAULT 0,
    image_url VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- إنشاء جدول العملاء
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- إنشاء جدول الطلبات
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    order_id VARCHAR(50) UNIQUE NOT NULL,
    customer_id INTEGER REFERENCES customers(id),
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- إنشاء جدول تفاصيل الطلبات
CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL
);

-- إدراج بيانات تجريبية للمنتجات
INSERT INTO products (name, description, price, category, stock, image_url) VALUES
('MacBook Pro M3', 'Latest MacBook Pro with M3 chip, 16GB RAM, 512GB SSD', 2499.99, 'Electronics', 15, 'https://example.com/macbook.jpg'),
('Coffee Premium Mug', 'Premium ceramic coffee mug with heat retention technology', 24.99, 'Home & Kitchen', 50, 'https://example.com/mug.jpg'),
('Cloud Computing Book', 'Complete guide to modern cloud technologies and DevOps practices', 49.99, 'Education', 30, 'https://example.com/book.jpg'),
('Wireless Headphones', 'Premium noise-cancelling wireless headphones', 199.99, 'Electronics', 25, 'https://example.com/headphones.jpg'),
('Smart Watch', 'Advanced fitness tracking smartwatch with GPS', 299.99, 'Electronics', 20, 'https://example.com/watch.jpg'),
('Ergonomic Keyboard', 'Mechanical keyboard designed for programming', 129.99, 'Electronics', 35, 'https://example.com/keyboard.jpg');

-- إنشاء فهارس لتحسين الأداء
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at);
CREATE INDEX idx_customers_email ON customers(email);

-- إنشاء مستخدم للتطبيق مع صلاحيات محدودة
CREATE USER app_user WITH PASSWORD 'app_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;