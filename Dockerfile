version: '3.8'
services:
  kms:
    image: pykmsorg/py-kms
    container_name: kms-server
    ports:
      - "1688:1688"  # KMS service port
      - "8080:8080"  # GUI port
    restart: unless-stopped
    environment:
      - GUI=true
    command: ["python3", "pykms_Server.py", "--ip", "0.0.0.0", "--port", "1688", "-g", "0.0.0.0", "-P", "8080"]
