FROM almalinux:8

# Enable PowerTools (Alma's CRB equivalent)
RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --set-enabled powertools

# Add EPEL and install everything else
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    dnf install -y \
        httpd mariadb-server \
        perl perl-DBI perl-DBD-MySQL \
        perl-GD perl-DateTime perl-Template-Toolkit \
        wget tar make gcc \
    && dnf clean all

# Add the bugzilla source files
COPY bugzilla-5.2/ /var/www/html/


# Install cpanm
RUN curl -L https://cpanmin.us -o /usr/local/bin/cpanm && \
    chmod +x /usr/local/bin/cpanm

# Install key Perl modules
RUN /usr/local/bin/cpanm \
    Email::Sender \
    Email::MIME \
    Template::Toolkit \
    DBD::MariaDB \
    DateTime \
    GD \
    Time::HiRes || true


EXPOSE 80

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
