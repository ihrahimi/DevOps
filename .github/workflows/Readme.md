# Nginx Deployment Automation

This repository contains a GitHub Actions workflow that automatically deploys an `index.html` file to an Nginx web server whenever changes are pushed to the `main` branch.

## Workflow Overview

The workflow performs the following actions:
1. Triggers on pushes to the `main` branch when `jenkins/nginx-simple/index.html` is modified
2. Checks out the repository
3. Sets up SSH access to the remote server
4. Deploys the `index.html` file to the remote server
5. Reloads Nginx to apply changes

## Workflow Name
**Deploy Nginx Index**

## Trigger Conditions
- Triggered on `push` events to the `main` branch
- Only runs when changes are made to:  
  `jenkins/nginx-simple/index.html`

## Workflow Steps

1. **Checkout repository**:  
   Uses `actions/checkout@v4` to clone the repository

2. **Install SSH key**:  
   - Uses `shimataro/ssh-key-action@v2` to configure SSH access
   - Requires GitHub secrets for authentication:
     - `SSH_PRIVATE_KEY`: Private key for server access
     - `KNOWN_HOSTS`: Server's host key fingerprint

3. **Deploy index.html**:  
   - Copies the file to `/var/www/html/index.html` on the remote server
   - Reloads Nginx to apply changes immediately

## Required Secrets

This workflow requires the following secrets to be configured in your GitHub repository:

| Secret Name      | Description                          |
|------------------|--------------------------------------|
| `SSH_PRIVATE_KEY`| Private SSH key for server access    |
| `SSH_USER`       | Username for SSH authentication     |
| `SSH_HOST`       | Hostname/IP of the remote server    |
| `KNOWN_HOSTS`    | Server's host key fingerprint       |

## File Structure
└── jenkins/
└── nginx-simple/
└── index.html # The HTML file deployed to the server

## Deployment Path

The workflow deploys the file to:  
`/var/www/html/index.html` on the remote server

## Nginx Configuration

After deployment, the workflow automatically runs:  
`sudo systemctl reload nginx`  
to apply changes without downtime.

## Security Notes

1. The workflow disables strict host key checking (`-o StrictHostKeyChecking=no`) for simplicity. For production use, consider using proper host verification.
2. Ensure your SSH private key is properly secured in GitHub secrets.
3. The workflow assumes the SSH user has sudo privileges to reload Nginx.

## Customization

To adapt this workflow for your needs:
1. Update the trigger paths if your file location changes
2. Modify the deployment path if your Nginx configuration differs
3. Adjust the post-deployment commands as needed
4. Update the SSH secrets to match your server credentials

## Accessing the Deployed Site

After successful deployment, your site will be available at:  
`http://[your-server-ip-or-domain]/index.html`
