﻿using UFSCar.BD.Model;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace UFSCar.BD.Repository
{
    public class ConfigModel
    {

        public static DbConnection Conexao
        {
            get
            {
                string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["EntitiesModels"].ConnectionString;

                DbConnection conn = new SqlConnection(strConnection);
                return conn;
            }
        }

        public static DbCompiledModel CompileModel
        {
            get
            {
                DbCompiledModel compilado = HttpRuntime.Cache.Get("CacheModelCompilerUFSCar") as DbCompiledModel;
                if (compilado == null)
                {
                    var builder = CompilaModel();

                    DbModel model = builder.Build(Conexao);
                    DbCompiledModel compliedModel = model.Compile();

                    HttpRuntime.Cache.Insert("CacheModelCompilerUFSCar", compliedModel);

                    return compliedModel;
                }
                else
                {
                    return compilado;
                }
            }
        }

        private static System.Data.Entity.DbModelBuilder CompilaModel()
        {
            var builder = new System.Data.Entity.DbModelBuilder();

            builder.Configurations.Add(new EntityTypeConfiguration<ImportacaoTipoArquivo>());
            builder.Configurations.Add(new EntityTypeConfiguration<ImportacaoArquivo>());
            builder.Configurations.Add(new EntityTypeConfiguration<ImportacaoCandidato>());
            builder.Configurations.Add(new EntityTypeConfiguration<ImportacaoBensCandidato>());
            builder.Configurations.Add(new EntityTypeConfiguration<ImportacaoLegenda>());
            builder.Configurations.Add(new EntityTypeConfiguration<ImportacaoVaga>());

            builder.Configurations.Add(new EntityTypeConfiguration<Cargo>());
            builder.Configurations.Add(new EntityTypeConfiguration<Eleicao>());
            builder.Configurations.Add(new EntityTypeConfiguration<EleicaoCargo>());
            builder.Configurations.Add(new EntityTypeConfiguration<Cidade>());
            builder.Configurations.Add(new EntityTypeConfiguration<Pais>());
            builder.Configurations.Add(new EntityTypeConfiguration<Estado>());
            builder.Configurations.Add(new EntityTypeConfiguration<Ocupacao>());

            return builder;
        }

    }
}
