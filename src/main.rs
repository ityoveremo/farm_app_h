use axum::{
    routing::get,
    Router,
};

async fn health_check() -> &'static str {
    "ok"
}

#[tokio::main]
async fn main() {
    let app = Router::new().route("/health", get(health_check));

    let listener =
        tokio::net::TcpListener::bind("0.0.0.0:3001").await.expect("Failed to bind to 0.0.0.0:3001");

    axum::serve(listener, app)
        .await
        .expect("Server error");
}
