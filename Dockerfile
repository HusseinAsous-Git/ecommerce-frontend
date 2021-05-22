FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build 


FROM tomcat
COPY --from=builder /usr/app/dist /usr/local/tomcat/webapps/