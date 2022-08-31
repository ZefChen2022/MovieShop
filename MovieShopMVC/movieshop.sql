IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Movies] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [Overview] nvarchar(max) NOT NULL,
    [Tagline] nvarchar(max) NOT NULL,
    [Budget] decimal(18,2) NULL,
    [Revenue] decimal(18,2) NULL,
    [ImdbUrl] nvarchar(max) NOT NULL,
    [TmdbUrl] nvarchar(max) NOT NULL,
    [PosterUrl] nvarchar(max) NOT NULL,
    [BackdropUrl] nvarchar(max) NOT NULL,
    [OriginalLanguage] nvarchar(max) NOT NULL,
    [ReleaseDate] datetime2 NULL,
    [RunTime] int NULL,
    [Price] decimal(18,2) NULL,
    [CreatedDate] datetime2 NULL,
    [UpdatedDate] datetime2 NULL,
    [UpdatedBy] nvarchar(max) NULL,
    [CreatedBy] nvarchar(max) NULL,
    [Rating] decimal(18,2) NULL,
    CONSTRAINT [PK_Movies] PRIMARY KEY ([Id])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825033936_InitialMigration', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'TmdbUrl');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Movies] ALTER COLUMN [TmdbUrl] nvarchar(2084) NOT NULL;
GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'Title');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Movies] ALTER COLUMN [Title] nvarchar(256) NOT NULL;
GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'Tagline');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [Movies] ALTER COLUMN [Tagline] nvarchar(512) NOT NULL;
GO

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'PosterUrl');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [Movies] ALTER COLUMN [PosterUrl] nvarchar(2084) NOT NULL;
GO

DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'OriginalLanguage');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [Movies] ALTER COLUMN [OriginalLanguage] nvarchar(64) NOT NULL;
GO

DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'ImdbUrl');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [Movies] ALTER COLUMN [ImdbUrl] nvarchar(2084) NOT NULL;
GO

DECLARE @var6 sysname;
SELECT @var6 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'BackdropUrl');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var6 + '];');
ALTER TABLE [Movies] ALTER COLUMN [BackdropUrl] nvarchar(2084) NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825150242_ChangingMovieTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var7 sysname;
SELECT @var7 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'Rating');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var7 + '];');
ALTER TABLE [Movies] DROP COLUMN [Rating];
GO

DECLARE @var8 sysname;
SELECT @var8 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'UpdatedBy');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var8 + '];');
ALTER TABLE [Movies] ALTER COLUMN [UpdatedBy] nvarchar(512) NULL;
GO

DECLARE @var9 sysname;
SELECT @var9 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'Title');
IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var9 + '];');
ALTER TABLE [Movies] ALTER COLUMN [Title] nvarchar(512) NOT NULL;
GO

DECLARE @var10 sysname;
SELECT @var10 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'Revenue');
IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var10 + '];');
ALTER TABLE [Movies] ALTER COLUMN [Revenue] decimal(18,4) NULL;
ALTER TABLE [Movies] ADD DEFAULT 9.9 FOR [Revenue];
GO

DECLARE @var11 sysname;
SELECT @var11 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'Price');
IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var11 + '];');
ALTER TABLE [Movies] ALTER COLUMN [Price] decimal(5,2) NULL;
ALTER TABLE [Movies] ADD DEFAULT 9.9 FOR [Price];
GO

DECLARE @var12 sysname;
SELECT @var12 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'CreatedDate');
IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var12 + '];');
ALTER TABLE [Movies] ADD DEFAULT (getdate()) FOR [CreatedDate];
GO

DECLARE @var13 sysname;
SELECT @var13 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'CreatedBy');
IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var13 + '];');
ALTER TABLE [Movies] ALTER COLUMN [CreatedBy] nvarchar(512) NULL;
GO

DECLARE @var14 sysname;
SELECT @var14 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Movies]') AND [c].[name] = N'Budget');
IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [Movies] DROP CONSTRAINT [' + @var14 + '];');
ALTER TABLE [Movies] ALTER COLUMN [Budget] decimal(18,4) NULL;
ALTER TABLE [Movies] ADD DEFAULT 9.9 FOR [Budget];
GO

CREATE INDEX [IX_Movies_Budget] ON [Movies] ([Budget]);
GO

CREATE INDEX [IX_Movies_Price] ON [Movies] ([Price]);
GO

CREATE INDEX [IX_Movies_Revenue] ON [Movies] ([Revenue]);
GO

CREATE INDEX [IX_Movies_Title] ON [Movies] ([Title]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825153433_UpdatingMovieTableWithFluentAPI', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Genres] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Genres] PRIMARY KEY ([Id])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825154251_CreatingGenreTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var15 sysname;
SELECT @var15 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Genres]') AND [c].[name] = N'Name');
IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [Genres] DROP CONSTRAINT [' + @var15 + '];');
ALTER TABLE [Genres] ALTER COLUMN [Name] nvarchar(24) NOT NULL;
GO

CREATE TABLE [MoviesGenre] (
    [MovieId] int NOT NULL,
    [GenreId] int NOT NULL,
    CONSTRAINT [PK_MoviesGenre] PRIMARY KEY ([MovieId], [GenreId]),
    CONSTRAINT [FK_MoviesGenre_Genres_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genres] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_MoviesGenre_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_MoviesGenre_GenreId] ON [MoviesGenre] ([GenreId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825160705_CreatingMovieGenre', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Trailers] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(2084) NOT NULL,
    [TrailerUrl] nvarchar(2084) NOT NULL,
    [MovieId] int NOT NULL,
    CONSTRAINT [PK_Trailers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Trailers_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Trailers_MovieId] ON [Trailers] ([MovieId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825162357_CreatingTrailerTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [MoviesGenre] ADD [CastId] int NULL;
GO

CREATE TABLE [Casts] (
    [Id] int NOT NULL IDENTITY,
    [Gender] nvarchar(max) NOT NULL,
    [Name] nvarchar(128) NOT NULL,
    [ProfilePath] nvarchar(2084) NOT NULL,
    [TmdbUrl] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Casts] PRIMARY KEY ([Id])
);
GO

CREATE INDEX [IX_MoviesGenre_CastId] ON [MoviesGenre] ([CastId]);
GO

ALTER TABLE [MoviesGenre] ADD CONSTRAINT [FK_MoviesGenre_Casts_CastId] FOREIGN KEY ([CastId]) REFERENCES [Casts] ([Id]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825164318_CreatingCastTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [MoviesGenre] DROP CONSTRAINT [FK_MoviesGenre_Casts_CastId];
GO

DROP INDEX [IX_MoviesGenre_CastId] ON [MoviesGenre];
GO

DECLARE @var16 sysname;
SELECT @var16 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[MoviesGenre]') AND [c].[name] = N'CastId');
IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [MoviesGenre] DROP CONSTRAINT [' + @var16 + '];');
ALTER TABLE [MoviesGenre] DROP COLUMN [CastId];
GO

CREATE TABLE [MoviesCast] (
    [CastId] int NOT NULL,
    [MovieId] int NOT NULL,
    [Character] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_MoviesCast] PRIMARY KEY ([MovieId], [CastId], [Character]),
    CONSTRAINT [FK_MoviesCast_Casts_CastId] FOREIGN KEY ([CastId]) REFERENCES [Casts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_MoviesCast_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_MoviesCast_CastId] ON [MoviesCast] ([CastId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825171550_CreatingMovieCast', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Users] (
    [Id] int NOT NULL IDENTITY,
    [DateOfBirth] datetime2 NOT NULL,
    [Email] nvarchar(256) NOT NULL,
    [FirstName] nvarchar(128) NOT NULL,
    [HashedPassword] nvarchar(1024) NOT NULL,
    [LastName] nvarchar(128) NOT NULL,
    [PhoneNumber] nvarchar(16) NOT NULL,
    [ProfilePictureUrl] nvarchar(max) NOT NULL,
    [Salt] nvarchar(1024) NOT NULL,
    [IsLocked] int NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825173449_CreatingUserTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Review] (
    [MovieId] int NOT NULL,
    [UserId] int NOT NULL,
    [CreatedDate] datetime2 NOT NULL,
    [Rating] decimal(3,2) NOT NULL DEFAULT 0.0,
    [ReviewText] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Review] PRIMARY KEY ([MovieId], [UserId]),
    CONSTRAINT [FK_Review_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Review_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Review_UserId] ON [Review] ([UserId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825175404_CreatingReviewTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Purchase] (
    [MovieId] int NOT NULL,
    [UserId] int NOT NULL,
    [PurchaseDateTime] datetime2 NOT NULL,
    [PurchaseNumber] uniqueidentifier NOT NULL,
    [TotalPrice] decimal(5,2) NOT NULL DEFAULT 0.0,
    CONSTRAINT [PK_Purchase] PRIMARY KEY ([MovieId], [UserId]),
    CONSTRAINT [FK_Purchase_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Purchase_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Purchase_UserId] ON [Purchase] ([UserId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825183402_CreatingPurchaseTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825185427_ModifyingPurchaseTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Favorite] (
    [MovieId] int NOT NULL,
    [UserId] int NOT NULL,
    CONSTRAINT [PK_Favorite] PRIMARY KEY ([MovieId], [UserId]),
    CONSTRAINT [FK_Favorite_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Favorite_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE UNIQUE INDEX [IX_Favorite_UserId] ON [Favorite] ([UserId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825190900_CreatingFavoriteTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Roles] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(20) NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825191945_CreatingRoleTable', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Favorite] DROP CONSTRAINT [FK_Favorite_Movies_MovieId];
GO

ALTER TABLE [Favorite] DROP CONSTRAINT [FK_Favorite_Users_UserId];
GO

ALTER TABLE [Purchase] DROP CONSTRAINT [FK_Purchase_Movies_MovieId];
GO

ALTER TABLE [Purchase] DROP CONSTRAINT [FK_Purchase_Users_UserId];
GO

ALTER TABLE [Review] DROP CONSTRAINT [FK_Review_Movies_MovieId];
GO

ALTER TABLE [Review] DROP CONSTRAINT [FK_Review_Users_UserId];
GO

ALTER TABLE [Review] DROP CONSTRAINT [PK_Review];
GO

ALTER TABLE [Purchase] DROP CONSTRAINT [PK_Purchase];
GO

ALTER TABLE [Favorite] DROP CONSTRAINT [PK_Favorite];
GO

EXEC sp_rename N'[Review]', N'Reviews';
GO

EXEC sp_rename N'[Purchase]', N'Purchases';
GO

EXEC sp_rename N'[Favorite]', N'Favorites';
GO

EXEC sp_rename N'[Reviews].[IX_Review_UserId]', N'IX_Reviews_UserId', N'INDEX';
GO

EXEC sp_rename N'[Purchases].[IX_Purchase_UserId]', N'IX_Purchases_UserId', N'INDEX';
GO

EXEC sp_rename N'[Favorites].[IX_Favorite_UserId]', N'IX_Favorites_UserId', N'INDEX';
GO

ALTER TABLE [Reviews] ADD CONSTRAINT [PK_Reviews] PRIMARY KEY ([MovieId], [UserId]);
GO

ALTER TABLE [Purchases] ADD CONSTRAINT [PK_Purchases] PRIMARY KEY ([MovieId], [UserId]);
GO

ALTER TABLE [Favorites] ADD CONSTRAINT [PK_Favorites] PRIMARY KEY ([MovieId], [UserId]);
GO

CREATE TABLE [UserRoles] (
    [RoleId] int NOT NULL,
    [UserId] int NOT NULL,
    [RolesId] int NOT NULL,
    CONSTRAINT [PK_UserRoles] PRIMARY KEY ([RoleId], [UserId]),
    CONSTRAINT [FK_UserRoles_Movies_RolesId] FOREIGN KEY ([RolesId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_UserRoles_RolesId] ON [UserRoles] ([RolesId]);
GO

CREATE UNIQUE INDEX [IX_UserRoles_UserId] ON [UserRoles] ([UserId]);
GO

ALTER TABLE [Favorites] ADD CONSTRAINT [FK_Favorites_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Favorites] ADD CONSTRAINT [FK_Favorites_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Purchases] ADD CONSTRAINT [FK_Purchases_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Purchases] ADD CONSTRAINT [FK_Purchases_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Reviews_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Reviews_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220825192817_CreatingUserRole', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [MoviesCast] DROP CONSTRAINT [FK_MoviesCast_Casts_CastId];
GO

ALTER TABLE [MoviesCast] DROP CONSTRAINT [FK_MoviesCast_Movies_MovieId];
GO

ALTER TABLE [MoviesGenre] DROP CONSTRAINT [FK_MoviesGenre_Genres_GenreId];
GO

ALTER TABLE [MoviesGenre] DROP CONSTRAINT [FK_MoviesGenre_Movies_MovieId];
GO

ALTER TABLE [MoviesGenre] DROP CONSTRAINT [PK_MoviesGenre];
GO

ALTER TABLE [MoviesCast] DROP CONSTRAINT [PK_MoviesCast];
GO

EXEC sp_rename N'[MoviesGenre]', N'MoviesGenres';
GO

EXEC sp_rename N'[MoviesCast]', N'MoviesCasts';
GO

EXEC sp_rename N'[MoviesGenres].[IX_MoviesGenre_GenreId]', N'IX_MoviesGenres_GenreId', N'INDEX';
GO

EXEC sp_rename N'[MoviesCasts].[IX_MoviesCast_CastId]', N'IX_MoviesCasts_CastId', N'INDEX';
GO

ALTER TABLE [MoviesGenres] ADD CONSTRAINT [PK_MoviesGenres] PRIMARY KEY ([MovieId], [GenreId]);
GO

ALTER TABLE [MoviesCasts] ADD CONSTRAINT [PK_MoviesCasts] PRIMARY KEY ([MovieId], [CastId], [Character]);
GO

ALTER TABLE [MoviesCasts] ADD CONSTRAINT [FK_MoviesCasts_Casts_CastId] FOREIGN KEY ([CastId]) REFERENCES [Casts] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MoviesCasts] ADD CONSTRAINT [FK_MoviesCasts_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MoviesGenres] ADD CONSTRAINT [FK_MoviesGenres_Genres_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genres] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MoviesGenres] ADD CONSTRAINT [FK_MoviesGenres_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220828161129_PluralAdjustment', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [MoviesCast] DROP CONSTRAINT [FK_MoviesCast_Cast_CastId];
GO

ALTER TABLE [MoviesCast] DROP CONSTRAINT [FK_MoviesCast_Movie_MovieId];
GO

ALTER TABLE [MoviesGenre] DROP CONSTRAINT [FK_MoviesGenre_Genre_GenreId];
GO

ALTER TABLE [MoviesGenre] DROP CONSTRAINT [FK_MoviesGenre_Movie_MovieId];
GO

ALTER TABLE [MoviesGenre] DROP CONSTRAINT [PK_MoviesGenre];
GO

ALTER TABLE [MoviesCast] DROP CONSTRAINT [PK_MoviesCast];
GO

EXEC sp_rename N'[MoviesGenre]', N'MovieGenre';
GO

EXEC sp_rename N'[MoviesCast]', N'MovieCast';
GO

EXEC sp_rename N'[MovieGenre].[IX_MoviesGenre_GenreId]', N'IX_MovieGenre_GenreId', N'INDEX';
GO

EXEC sp_rename N'[MovieCast].[IX_MoviesCast_CastId]', N'IX_MovieCast_CastId', N'INDEX';
GO

ALTER TABLE [MovieGenre] ADD CONSTRAINT [PK_MovieGenre] PRIMARY KEY ([MovieId], [GenreId]);
GO

ALTER TABLE [MovieCast] ADD CONSTRAINT [PK_MovieCast] PRIMARY KEY ([MovieId], [CastId], [Character]);
GO

ALTER TABLE [MovieCast] ADD CONSTRAINT [FK_MovieCast_Cast_CastId] FOREIGN KEY ([CastId]) REFERENCES [Cast] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MovieCast] ADD CONSTRAINT [FK_MovieCast_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MovieGenre] ADD CONSTRAINT [FK_MovieGenre_Genre_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genre] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MovieGenre] ADD CONSTRAINT [FK_MovieGenre_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220828164044_SingularAdjustment', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var17 sysname;
SELECT @var17 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'LockoutEndDate');
IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var17 + '];');
ALTER TABLE [User] ALTER COLUMN [LockoutEndDate] datetime2 NULL;
GO

DECLARE @var18 sysname;
SELECT @var18 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[User]') AND [c].[name] = N'LastLoginDateTime');
IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [User] DROP CONSTRAINT [' + @var18 + '];');
ALTER TABLE [User] ALTER COLUMN [LastLoginDateTime] datetime2 NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220828182856_ModifyingUser', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var19 sysname;
SELECT @var19 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Review]') AND [c].[name] = N'CreatedDate');
IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [Review] DROP CONSTRAINT [' + @var19 + '];');
ALTER TABLE [Review] ALTER COLUMN [CreatedDate] datetime2 NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220828192953_ModifyingReview', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Purchase] DROP CONSTRAINT [PK_Purchase];
GO

ALTER TABLE [Purchase] ADD [Id] int NOT NULL DEFAULT 0;
GO

ALTER TABLE [Purchase] ADD CONSTRAINT [PK_Purchase] PRIMARY KEY ([Id], [MovieId], [UserId]);
GO

CREATE INDEX [IX_Purchase_MovieId] ON [Purchase] ([MovieId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220828203742_ModifyingPurchase', N'6.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Favorite] DROP CONSTRAINT [FK_Favorite_Movie_MovieId];
GO

ALTER TABLE [Favorite] DROP CONSTRAINT [FK_Favorite_User_UserId];
GO

ALTER TABLE [MovieCast] DROP CONSTRAINT [FK_MovieCast_Cast_CastId];
GO

ALTER TABLE [MovieCast] DROP CONSTRAINT [FK_MovieCast_Movie_MovieId];
GO

ALTER TABLE [MovieGenre] DROP CONSTRAINT [FK_MovieGenre_Genre_GenreId];
GO

ALTER TABLE [MovieGenre] DROP CONSTRAINT [FK_MovieGenre_Movie_MovieId];
GO

ALTER TABLE [Purchase] DROP CONSTRAINT [FK_Purchase_Movie_MovieId];
GO

ALTER TABLE [Purchase] DROP CONSTRAINT [FK_Purchase_User_UserId];
GO

ALTER TABLE [Review] DROP CONSTRAINT [FK_Review_Movie_MovieId];
GO

ALTER TABLE [Review] DROP CONSTRAINT [FK_Review_User_UserId];
GO

ALTER TABLE [Trailer] DROP CONSTRAINT [FK_Trailer_Movie_MovieId];
GO

ALTER TABLE [UserRole] DROP CONSTRAINT [FK_UserRole_Movie_RolesId];
GO

ALTER TABLE [UserRole] DROP CONSTRAINT [FK_UserRole_Role_RoleId];
GO

ALTER TABLE [UserRole] DROP CONSTRAINT [FK_UserRole_User_UserId];
GO

ALTER TABLE [UserRole] DROP CONSTRAINT [PK_UserRole];
GO

ALTER TABLE [User] DROP CONSTRAINT [PK_User];
GO

ALTER TABLE [Trailer] DROP CONSTRAINT [PK_Trailer];
GO

ALTER TABLE [Role] DROP CONSTRAINT [PK_Role];
GO

ALTER TABLE [Review] DROP CONSTRAINT [PK_Review];
GO

ALTER TABLE [Purchase] DROP CONSTRAINT [PK_Purchase];
GO

ALTER TABLE [MovieGenre] DROP CONSTRAINT [PK_MovieGenre];
GO

ALTER TABLE [MovieCast] DROP CONSTRAINT [PK_MovieCast];
GO

ALTER TABLE [Movie] DROP CONSTRAINT [PK_Movie];
GO

ALTER TABLE [Genre] DROP CONSTRAINT [PK_Genre];
GO

ALTER TABLE [Favorite] DROP CONSTRAINT [PK_Favorite];
GO

ALTER TABLE [Cast] DROP CONSTRAINT [PK_Cast];
GO

EXEC sp_rename N'[UserRole]', N'UserRoles';
GO

EXEC sp_rename N'[User]', N'Users';
GO

EXEC sp_rename N'[Trailer]', N'Trailers';
GO

EXEC sp_rename N'[Role]', N'Roles';
GO

EXEC sp_rename N'[Review]', N'Reviews';
GO

EXEC sp_rename N'[Purchase]', N'Purchases';
GO

EXEC sp_rename N'[MovieGenre]', N'MovieGenres';
GO

EXEC sp_rename N'[MovieCast]', N'MovieCasts';
GO

EXEC sp_rename N'[Movie]', N'Movies';
GO

EXEC sp_rename N'[Genre]', N'Genres';
GO

EXEC sp_rename N'[Favorite]', N'Favorites';
GO

EXEC sp_rename N'[Cast]', N'Casts';
GO

EXEC sp_rename N'[UserRoles].[IX_UserRole_UserId]', N'IX_UserRoles_UserId', N'INDEX';
GO

EXEC sp_rename N'[UserRoles].[IX_UserRole_RolesId]', N'IX_UserRoles_RolesId', N'INDEX';
GO

EXEC sp_rename N'[Trailers].[IX_Trailer_MovieId]', N'IX_Trailers_MovieId', N'INDEX';
GO

EXEC sp_rename N'[Reviews].[IX_Review_UserId]', N'IX_Reviews_UserId', N'INDEX';
GO

EXEC sp_rename N'[Purchases].[IX_Purchase_UserId]', N'IX_Purchases_UserId', N'INDEX';
GO

EXEC sp_rename N'[Purchases].[IX_Purchase_MovieId]', N'IX_Purchases_MovieId', N'INDEX';
GO

EXEC sp_rename N'[MovieGenres].[IX_MovieGenre_GenreId]', N'IX_MovieGenres_GenreId', N'INDEX';
GO

EXEC sp_rename N'[MovieCasts].[IX_MovieCast_CastId]', N'IX_MovieCasts_CastId', N'INDEX';
GO

EXEC sp_rename N'[Movies].[IX_Movie_Title]', N'IX_Movies_Title', N'INDEX';
GO

EXEC sp_rename N'[Movies].[IX_Movie_Revenue]', N'IX_Movies_Revenue', N'INDEX';
GO

EXEC sp_rename N'[Movies].[IX_Movie_Price]', N'IX_Movies_Price', N'INDEX';
GO

EXEC sp_rename N'[Movies].[IX_Movie_Budget]', N'IX_Movies_Budget', N'INDEX';
GO

EXEC sp_rename N'[Favorites].[IX_Favorite_UserId]', N'IX_Favorites_UserId', N'INDEX';
GO

ALTER TABLE [UserRoles] ADD CONSTRAINT [PK_UserRoles] PRIMARY KEY ([RoleId], [UserId]);
GO

ALTER TABLE [Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY ([Id]);
GO

ALTER TABLE [Trailers] ADD CONSTRAINT [PK_Trailers] PRIMARY KEY ([Id]);
GO

ALTER TABLE [Roles] ADD CONSTRAINT [PK_Roles] PRIMARY KEY ([Id]);
GO

ALTER TABLE [Reviews] ADD CONSTRAINT [PK_Reviews] PRIMARY KEY ([MovieId], [UserId]);
GO

ALTER TABLE [Purchases] ADD CONSTRAINT [PK_Purchases] PRIMARY KEY ([Id], [MovieId], [UserId]);
GO

ALTER TABLE [MovieGenres] ADD CONSTRAINT [PK_MovieGenres] PRIMARY KEY ([MovieId], [GenreId]);
GO

ALTER TABLE [MovieCasts] ADD CONSTRAINT [PK_MovieCasts] PRIMARY KEY ([MovieId], [CastId], [Character]);
GO

ALTER TABLE [Movies] ADD CONSTRAINT [PK_Movies] PRIMARY KEY ([Id]);
GO

ALTER TABLE [Genres] ADD CONSTRAINT [PK_Genres] PRIMARY KEY ([Id]);
GO

ALTER TABLE [Favorites] ADD CONSTRAINT [PK_Favorites] PRIMARY KEY ([MovieId], [UserId]);
GO

ALTER TABLE [Casts] ADD CONSTRAINT [PK_Casts] PRIMARY KEY ([Id]);
GO

ALTER TABLE [Favorites] ADD CONSTRAINT [FK_Favorites_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Favorites] ADD CONSTRAINT [FK_Favorites_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MovieCasts] ADD CONSTRAINT [FK_MovieCasts_Casts_CastId] FOREIGN KEY ([CastId]) REFERENCES [Casts] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MovieCasts] ADD CONSTRAINT [FK_MovieCasts_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MovieGenres] ADD CONSTRAINT [FK_MovieGenres_Genres_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [Genres] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [MovieGenres] ADD CONSTRAINT [FK_MovieGenres_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Purchases] ADD CONSTRAINT [FK_Purchases_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Purchases] ADD CONSTRAINT [FK_Purchases_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Reviews_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Reviews] ADD CONSTRAINT [FK_Reviews_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [Trailers] ADD CONSTRAINT [FK_Trailers_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [UserRoles] ADD CONSTRAINT [FK_UserRoles_Movies_RolesId] FOREIGN KEY ([RolesId]) REFERENCES [Movies] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [UserRoles] ADD CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [UserRoles] ADD CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220829141432_MondayPluralAdjustment', N'6.0.8');
GO

COMMIT;
GO

