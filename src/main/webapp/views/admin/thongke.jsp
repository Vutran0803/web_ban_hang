  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="container-fluid mt-4">
            <h1 class="mt-12">Thống kê</h1>
            <div class="row">
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <h5 class="card-title">Tổng số User</h5>
                            <p class="card-text">26K</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <h5 class="card-title">Tổng số Sản phẩm</h5>
                            <p class="card-text">$6,200</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-warning">
                        <div class="card-body">
                            <h5 class="card-title">Tỷ lệ Chuyển đổi</h5>
                            <p class="card-text">2.49%</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card text-white bg-danger">
                        <div class="card-body">
                            <h5 class="card-title">Số phiên</h5>
                            <p class="card-text">44K</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-line"></i> Traffic
                </div>
                <div class="card-body">
                    <canvas id="myChart" width="100%" height="30"></canvas>
                </div>
            </div>
        </div>
        