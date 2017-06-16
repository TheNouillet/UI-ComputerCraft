-- The Database object provide an easy way to persist and query Lua objects in files
Database = {
            name = "db",
            content = {}
           }
-- Create a new instance of Database.
function Database:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
-- Apply the changes to the database file.
function Database:commit()
    -- We first verify if the "db" folder exists and, if not, create it
    dbPath = "/db"
    if not(fs.exists(dbPath)) then
        fs.makeDir(dbPath)
    end
    h = fs.open(dbPath .. "/" .. self.name, "w")
    h.write(textutils.serialize(self.content))
    h.close()
end
-- Insert a new row in the given table into the database
function Database:insert(row, tableName)
    if self.content[tableName] == nil then
        self.content[tableName] = {}
    end
    table.insert(self.content[tableName], row)
end
-- Pull the content from database file
function Database:pull(tableName)
    dbPath = "/db"
    if not(fs.exists(dbPath)) then
        return nil
    end
    h = fs.open(dbPath .. "/" .. self.name, "r")
    self.content = textutils.unserialize(h.readAll())[tableName]
end