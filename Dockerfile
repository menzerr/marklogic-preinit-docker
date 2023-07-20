# First stage: initialize MarkLogic
FROM marklogicdb/marklogic-db:11.0.2-centos-1.0.2 as builder

USER root

ENV MARKLOGIC_ADMIN_USERNAME=admin \
    MARKLOGIC_ADMIN_PASSWORD=admin1234 \
    MARKLOGIC_INIT=true

# Copy the original script to a new location
RUN cp /usr/local/bin/start-marklogic.sh /usr/local/bin/start-marklogic-modified.sh

# Remove the line containing "tail -f /dev/null"
RUN sed -i '/tail -f \/dev\/null/d' /usr/local/bin/start-marklogic-modified.sh

# Now run the modified script
RUN /usr/local/bin/start-marklogic-modified.sh

# Second stage: import the state from the first stage
FROM marklogicdb/marklogic-db:11.0.2-centos-1.0.2

COPY --from=builder /var/opt /var/opt