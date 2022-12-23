# Dungeonmaster

This application shall provide a hub for all players who love Dungeons & Dragons. It will contain a spell database,  the ability to create new characters and a gamemaster overview to keep track of all players in a session.

## Setup a dev environment

The application is based on [Eclipse Scout](https://www.eclipse.org/scout/) and hence requires some prerequesites to be installed. You can also refer to the official [documentation](https://eclipsescout.github.io/)

1. First, Node.js needs to be installed as Scout uses it to build web assets.
   So if you don’t have it yet, visit the [Node.js download site](https://nodejs.org/dist/latest-v16.x/), choose the package for your platform and install it on your local machine.
   
   Make sure the Node.js installation is on the PATH. You can verify it by using your command line:
   
   ```
   c:\> node -v
   v16.13.0
   ```

2. Scout uses [pnpm 6](https://pnpm.io/) as package manager.
   Therefore, install it into your Node installation by using your command line:
   
   `npm install -g pnpm`
   
   and verify that it was installed successfully with:
   
   ```
   c:\> pnpm -v
   6.22.2
   ```

3. Then download the `Eclipse IDE for Scout Developers` package for your platform by visiting the [official Eclipse download page](https://www.eclipse.org/downloads/packages).
   After the package selection, confirm the suggested mirror and extract the downloaded archive to your local disk.
   
   Congratulations! You have successfully installed Eclipse for Scout development.

4. Dungeonmaster uses a postgresql database, so head over to the [PostgreSQL: Downloads](https://www.postgresql.org/download/) section, if you need to install it locally on your machine.

5. Run the setup script located here:
   
   ```
   [a relative link](dungeonmaster/dungeonmaster.server/sql/setup.sql)
   ```

6. You're now ready to go