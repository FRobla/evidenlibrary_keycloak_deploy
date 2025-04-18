FROM quay.io/keycloak/keycloak:22.0.1

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=secret
ENV KC_DB=mysql
ENV KC_DB_URL=jdbc:mysql://evidenlibrarydb-eviden-library.b.aivencloud.com:12052/keycloak?useSSL=false
ENV KC_DB_USERNAME=avnadmin
ENV KC_DB_PASSWORD=AVNS_XJkb-ofxXvwczq5swBx
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_PROXY=edge
ENV KC_TRANSACTION_XA_ENABLED=false
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8080

# Build Keycloak before starting it
RUN /opt/keycloak/bin/kc.sh build

# Expose port
EXPOSE 8080

# Start Keycloak in production mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--http-enabled=true", "--hostname-strict=false"]
