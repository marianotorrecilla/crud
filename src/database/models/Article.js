module.exports = (sequelize,DataTypes) =>{
    let alias = 'Article';
    let cols = {
        id: {
            type: DataTypes.INTEGER,
            primaryKey : true,
            allowNull: false,
            autoIncrement: true
        },
        footballTeam: DataTypes.STRING,
        stadiumName: DataTypes.STRING,
        description: DataTypes.STRING,
        price: DataTypes.DECIMAL,
        image: DataTypes.STRING,

    };
    let config = {
        tableName : 'articles',
    }
    const Article = sequelize.define(alias,cols,config);


    return Article;
}