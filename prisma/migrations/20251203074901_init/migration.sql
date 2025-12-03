-- CreateTable
CREATE TABLE "app_roles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "app_roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_user" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role_id" INTEGER NOT NULL DEFAULT 2,

    CONSTRAINT "users_user_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "app_roles_name_key" ON "app_roles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users_user_email_key" ON "users_user"("email");

-- AddForeignKey
ALTER TABLE "users_user" ADD CONSTRAINT "users_user_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "app_roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
