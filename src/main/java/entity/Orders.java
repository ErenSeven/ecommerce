package entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int orderId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "total_amount", precision = 10, scale = 2)
    private BigDecimal total_amount;

    @Column(name = "order_status", length = 50)
    private String orderStatus;

    @Column(name = "payment_method", length = 50)
    private String paymentMethod;

    @Column(name = "created_at")
    private Timestamp createdAt;

    // Constructors, getters, setters

    public Orders() {
    }

    public Orders(User user, BigDecimal total_amount, String orderStatus, String paymentMethod) {
        this.user = user;
        this.total_amount = total_amount;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BigDecimal getTotalAmount() {
        return total_amount;
    }

    public void setTotalAmount(BigDecimal total_amount) {
        this.total_amount = total_amount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
