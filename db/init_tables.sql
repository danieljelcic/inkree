CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.users (
    userId UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  
    firstName TEXT NOT NULL,  
    lastName TEXT NOT NULL,   
    email TEXT UNIQUE NOT NULL
) 

CREATE TABLE IF NOT EXISTS public.trees (
    treeId UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    treeQuery TEXT NOT NULL UNIQUE,
    owner UUID NOT NULL,
    title TEXT,
    description TEXT,
    image TEXT,

    CONSTRAINT fk_trees_owner 
        FOREIGN KEY(owner) 
            REFERENCES public.users(userId)
)

CREATE TABLE IF NOT EXISTS public.branches (
    branchId UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    treeId UUID NOT NULL,
    link TEXT NOT NULL, 
    title TEXT,
    description TEXT,
    image TEXT,

    CONSTRAINT fk_branches_tree 
        FOREIGN KEY(treeId) 
            REFERENCES public.trees(treeId)
)
