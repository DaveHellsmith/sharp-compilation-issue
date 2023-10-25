FROM node:18.18-buster as npm-test

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

FROM node:18.18-buster as pnpm-test

ENV PNPM_HOME="/pnpm"

ENV PATH="$PNPM_HOME:$PATH"

RUN corepack enable

WORKDIR /usr/src/app

COPY package.json ./

RUN pnpm install

