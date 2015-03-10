db.auth('scrapy', 'scrapy.pwd')

tgroup = db.text_group
tprofile = db.text_profile

items_count = db.items.count()
g_count = tgroup.count()
t_count = tprofile.count()
print('items count=' + items_count)
print('group count=' + g_count)
print('profile count=' + t_count)

prompt = function() {
    if (typeof db == 'undefined') {
        return "(nodb)> ";
    }

    try {
        db.runCommand({getLastError:1});
    }
    catch(e) {
        print(e)
    }

    return db+">"
}
