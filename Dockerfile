FROM searchathing/ubuntu

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get install -y makepasswd rcs perl-doc libio-tee-perl git libmail-imapclient-perl libdigest-md5-file-perl libterm-readkey-perl libfile-copy-recursive-perl build-essential make automake libunicode-string-perl libauthen-ntlm-perl libcrypt-ssleay-perl libdigest-hmac-perl libfile-copy-recursive-perl libio-compress-perl libio-socket-inet6-perl libio-socket-ssl-perl libio-tee-perl libmodule-scandeps-perl libnet-ssleay-perl libpar-packer-perl libreadonly-perl libterm-readkey-perl libtest-pod-perl libtest-simple-perl libunicode-string-perl liburi-perl cpanminus
RUN sudo cpanm JSON::WebToken Test::MockObject Unicode::String Data::Uniqid Sys::MemInfo Dist::CheckConflicts
RUN git clone git://github.com/imapsync/imapsync.git
RUN apt install -y libssl-dev
RUN cpanm JSON::WebToken::Crypt::RSA Crypt::OpenSSL::RSA
RUN cd imapsync && mkdir dist && make install
