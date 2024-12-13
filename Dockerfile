FROM rust:slim-bookworm as build-env
WORKDIR /app
COPY . /app
RUN cargo build --release

FROM gcr.io/distroless/cc-debian12
COPY --from=build-env /app/target/release/msr-hello-grpc /
EXPOSE 3000
ENTRYPOINT ["/msr-hello-grpc"]