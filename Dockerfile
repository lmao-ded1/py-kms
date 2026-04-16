FROM pykmsorg/py-kms

# Expose the required ports
EXPOSE 1688
EXPOSE 8080

# Set environment variable for GUI
ENV GUI=true

# Set the working directory
WORKDIR /home/py-kms

# Command to start the KMS server with GUI
CMD ["python3", "pykms_Server.py", "--ip", "0.0.0.0", "--port", "1688", "-g", "0.0.0.0", "-P", "8080"]
