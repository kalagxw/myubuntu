FROM ubuntu:20.04
MAINTAINER "kalagxw"

# timezone
RUN apt update && apt install -y tzdata; \
    apt clean;

# sshd
RUN mkdir /run/sshd; \
    apt install -y openssh-server; \
    sed -i 's/^#\(PasswordAuthentication\) .*/\1 no/' /etc/ssh/sshd_config; \
    sed -i 's/^#\(ChallengeResponseAuthentication\) .*/\1 no/' /etc/ssh/sshd_config; \
    sed -i 's/^\(UsePAM no\)/# \1/' /etc/ssh/sshd_config; \
    apt clean;

# entrypoint
RUN { \
    echo '#!/bin/bash -eu'; \
    echo 'ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime'; \
    echo 'mkdir -p /root/.ssh'; \
    echo "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAttCOKBNadAC5s4yE5JRIZ24UvZaB6K4mlU+txxAfmfyepuPlJw0Da6YX6iMUqj5iIsaYrCMUjszAsbNomnxfYKwVbFpnVZtMJVLeu1VLhCklYM4Btu0Q+5NalUQzmvmUx3Cc3Cr/BXmTzXVWDeyBGhdFkrMCdspS/xd9SU9wcpcOGxb8bRk3EWQS95ejdEL2S0F3t9E2PWEXrtk3JfWjR3IsY1hSJAAsHAd2/sQasAYktmJhZp2l+/E2NoSvrNrgTMZm5senQYhvAH4jn43ScxWqWbT2SLeGhQ/q0YEouscKoJLLEdijPx+yphh4TU8TDMZe+9oj9XMjAz8EHZqjWQ=='>/root/.ssh/authorized_keys"; \
    echo 'exec "$@"'; \
    } > /usr/local/bin/entry_point.sh; \
    chmod +x /usr/local/bin/entry_point.sh;

ENV TZ Asia/Shanghai

ENV LC_ALL zh_CN.UTF-8

EXPOSE 22

ENTRYPOINT ["entry_point.sh"]
CMD    ["/usr/sbin/sshd", "-D", "-e"]
