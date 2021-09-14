namespace Models.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CreateSurveysWEB : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Occurrences",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Type = c.Byte(nullable: false),
                        Date = c.DateTime(nullable: false),
                        Description = c.String(maxLength: 250),
                        SurveyId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Surveys", t => t.SurveyId, cascadeDelete: true)
                .Index(t => t.SurveyId);
            
            CreateTable(
                "dbo.Surveys",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Status = c.Int(nullable: false),
                        OpeningDate = c.DateTime(nullable: false),
                        Local = c.Binary(nullable: false),
                        Description = c.String(maxLength: 250),
                        Adress = c.String(nullable: false, maxLength: 250),
                        AnalistId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.AnalistId, cascadeDelete: true)
                .Index(t => t.AnalistId);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserType = c.Byte(nullable: false),
                        Name = c.String(nullable: false, maxLength: 70),
                        Cpf = c.String(nullable: false, maxLength: 14),
                        Login = c.String(nullable: false, maxLength: 50),
                        Email = c.String(nullable: false, maxLength: 250),
                        Password = c.String(nullable: false, maxLength: 80),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Cpf, unique: true)
                .Index(t => t.Login, unique: true)
                .Index(t => t.Email, unique: true);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Occurrences", "SurveyId", "dbo.Surveys");
            DropForeignKey("dbo.Surveys", "AnalistId", "dbo.Users");
            DropIndex("dbo.Users", new[] { "Email" });
            DropIndex("dbo.Users", new[] { "Login" });
            DropIndex("dbo.Users", new[] { "Cpf" });
            DropIndex("dbo.Surveys", new[] { "AnalistId" });
            DropIndex("dbo.Occurrences", new[] { "SurveyId" });
            DropTable("dbo.Users");
            DropTable("dbo.Surveys");
            DropTable("dbo.Occurrences");
        }
    }
}
