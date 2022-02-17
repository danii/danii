#                           o    
#    |                o  o  /    
#  __|   __,   _  _           ,  
# /  |  /  |  / |/ |  |  |   / \_
# \_/|_/\_/|_/  |  |_/|_/|_/  \/  ~/.profile

# I like my home folder private, except my Public folder.
umask 077

USERID=$(id -u)
PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"

# Make .cache temporary.
mkdir "/dev/shm/$USERID.cache"
ln -s "/dev/shm/$USERID.cache" .cache