FROM ghcr.io/wg-easy/wg-easy:latest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 51821

ENTRYPOINT ["/entrypoint.sh"]
