git filter-repo --force --commit-callback '
if commit.author_name == b"Taylor Huang":
  commit.author_name = b"thuang323"
  commit.author_email = b"taylorhuang0323@gmail.com"
  commit.committer_name = b"thuang323"
  commit.committer_email = b"taylorhuang0323@gmail.com"
'