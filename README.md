A diary shell script. (Name is a an attempted reference at **καθαίρω**/**καθαρός**)

# Installation

To create the working directory:
> mkdir -p ~/Documents/.Diary/{drafts,pages}

# Usage
## Creating a page
> ./katharso.sh new

## Editing the page:
> vim ~/Documents/.Diary/drafts/xxxxx.page #xxxx is the timestamp the moment the page was created

## Sealing the page:
> ./katharso.sh seal xxxxx.page

***IMPORTANT***: Type a password for the encryption of the page, and then confirm it. _Careful_, in case they don't match, the page is deleted,
a bug I never got around to fixing. Though it gives the thrill of being on the edge.

## Peeking at the page:
> ./katharso.sh peek xxxxx.sealed

## Listing all the pages:
> ./katharso.sh list

## Listing all the drafts:
> ./katharso.sh list-drafts
