/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-11.8.9-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: u727965524_airesume
-- ------------------------------------------------------
-- Server version	11.8.9-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `admin_audit_logs`
--

DROP TABLE IF EXISTS `admin_audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_audit_logs` (
  `id` varchar(128) NOT NULL,
  `actor_uid` varchar(128) NOT NULL,
  `actor_email` varchar(255) DEFAULT NULL,
  `actor_role` varchar(64) DEFAULT 'ADMIN',
  `action` varchar(128) NOT NULL,
  `category` varchar(128) DEFAULT 'general',
  `severity` varchar(32) DEFAULT 'INFO',
  `outcome` varchar(32) DEFAULT 'SUCCESS',
  `method` varchar(16) DEFAULT 'GET',
  `pathname` varchar(512) DEFAULT NULL,
  `status_code` int(11) DEFAULT 200,
  `resource_type` varchar(64) DEFAULT NULL,
  `resource_id` varchar(128) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `request_id` varchar(128) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_audit_actor` (`actor_uid`),
  KEY `idx_audit_action` (`action`),
  KEY `idx_audit_category` (`category`),
  KEY `idx_audit_resource` (`resource_id`),
  KEY `idx_audit_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_audit_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `admin_audit_logs` WRITE;
/*!40000 ALTER TABLE `admin_audit_logs` DISABLE KEYS */;
INSERT INTO `admin_audit_logs` VALUES
('0474b2e2-3e5c-4e0f-85f1-21004317b0ef','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/cosmos-reason2-8b\",\"apiKey\":\"[REDACTED]\"}}','b7a079b1-0775-4212-b0de-f4f95ebb3368','2026-11-17 07:21:24'),
('06324aeb-8a4f-47db-9990-11b99a0e30e5','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST_AI_SETTINGS','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai-settings',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"enableGemini\":false,\"geminiApiKey\":\"[REDACTED]\",\"model\":\"gemini-2.0-flash\",\"enableNvidia\":true,\"nvidiaApiKey\":\"[REDACTED]\",\"nvidiaModel\":\"auto\",\"nvidiaBaseUrl\":\"https://integrate.api.nvidia.com/v1\",\"enableOpenai\":false,\"openaiApiKey\":\"[REDACTED]\",\"openaiModel\":\"gpt-4o-mini\",\"openaiBaseUrl\":\"\",\"enableGroq\":false,\"groqApiKey\":\"[REDACTED]\",\"groqModel\":\"llama-3.3-70b-versatile\",\"enableOpenrouter\":true,\"openrouterApiKey\":\"[REDACTED]\",\"openrouterModel\":\"auto\",\"enableDeepseek\":false,\"deepseekApiKey\":\"[REDACTED]\",\"deepseekModel\":\"deepseek-chat\",\"enableOllama\":false,\"ollamaBaseUrl\":\"http://localhost:11434/v1\",\"ollamaModel\":\"llama3\",\"temperature\":0.7,\"maxTokens\":\"[REDACTED]\",\"enableFallback\":true,\"enableImportModule\":false,\"clearSecrets\":\"[REDACTED]\",\"expectedRevision\":48}}','bc7d511a-6750-4c88-8c65-9490f64d7fb6','2026-11-17 07:10:24'),
('09b724af-8198-48f3-aa94-92226aec27d9','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'SUPER_ADMIN','AI_PROVIDER_SETTINGS_UPDATED','ai.governance','HIGH','SUCCESS','POST','/api/admin/ai-settings',200,'system_settings','ai_providers','{\"revision\":50,\"changedFields\":[\"provider\",\"temperature\",\"maxTokens\",\"enableFallback\",\"enableImportModule\",\"enableNvidia\",\"nvidiaModel\",\"enableGemini\",\"model\",\"enableOpenai\",\"openaiModel\",\"enableGroq\",\"groqModel\",\"enableOpenrouter\",\"openrouterModel\",\"enableDeepseek\",\"deepseekModel\"]}','0b4043d5-2201-4403-a2b0-e44e6b1eeb51','2026-11-17 07:20:01'),
('0abb148b-8e5f-4ca9-9d82-ff188db5e948','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','ADMIN','ADMIN_SETTINGS_UPDATED','system.config','HIGH','SUCCESS','POST','/api/admin/settings/modules',200,'PLATFORM_CONFIG','modules','{\"category\":\"modules\",\"revision\":40,\"changedFields\":[\"enableJobTrackerModule\"]}','0bb68f99-79a5-467a-8265-7637e70ed1a9','2026-09-23 13:16:38'),
('0b68f646-2dc9-40d6-bc34-4e410810aa77','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','ADMIN','ADMIN_SETTINGS_UPDATED','system.config','HIGH','SUCCESS','POST','/api/admin/settings/modules',200,'PLATFORM_CONFIG','modules','{\"category\":\"modules\",\"revision\":38,\"changedFields\":[\"enableAppliedJobsModule\"]}','a99b8111-9371-417a-84a1-62063d73aaac','2026-09-23 13:16:22'),
('0e4546a7-728c-4a75-95db-53fc25173a25','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"SUPER_ADMIN\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-25T12:26:06.080Z\"}',NULL,'2026-09-25 12:26:06'),
('0e4e67ea-8b2f-48e0-8ba0-c08655f09418','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','6180fcc4-6aac-48d9-95f2-8424fcc8d7d3','2026-09-24 13:03:31'),
('0e603ed2-dfab-4e0e-978e-058dee384c3e','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','857b22fa-ba1d-4d39-958f-575fd4b19da9','2026-09-24 13:11:49'),
('0e976b9a-d278-43f2-ac9a-8a5eba6371bc','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST_AI_SETTINGS','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai-settings',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"enableGemini\":false,\"geminiApiKey\":\"[REDACTED]\",\"model\":\"gemini-2.0-flash\",\"enableNvidia\":true,\"nvidiaApiKey\":\"[REDACTED]\",\"nvidiaModel\":\"auto\",\"nvidiaBaseUrl\":\"https://integrate.api.nvidia.com/v1\",\"enableOpenai\":false,\"openaiApiKey\":\"[REDACTED]\",\"openaiModel\":\"gpt-4o-mini\",\"openaiBaseUrl\":\"\",\"enableGroq\":false,\"groqApiKey\":\"[REDACTED]\",\"groqModel\":\"llama-3.3-70b-versatile\",\"enableOpenrouter\":true,\"openrouterApiKey\":\"[REDACTED]\",\"openrouterModel\":\"auto\",\"enableDeepseek\":false,\"deepseekApiKey\":\"[REDACTED]\",\"deepseekModel\":\"deepseek-chat\",\"enableOllama\":false,\"ollamaBaseUrl\":\"http://localhost:11434/v1\",\"ollamaModel\":\"llama3\",\"temperature\":0.7,\"maxTokens\":\"[REDACTED]\",\"enableFallback\":true,\"enableImportModule\":false,\"clearSecrets\":\"[REDACTED]\",\"expectedRevision\":46}}','942f10e6-a399-4d51-81cc-61be193c36bb','2026-09-24 13:04:15'),
('0f6af49e-70a1-4328-93f2-59468b06addd','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'SUPER_ADMIN','AI_PROVIDER_SETTINGS_UPDATED','ai.governance','HIGH','SUCCESS','POST','/api/admin/ai-settings',200,'system_settings','ai_providers','{\"revision\":47,\"changedFields\":[\"provider\",\"temperature\",\"maxTokens\",\"enableFallback\",\"enableImportModule\",\"enableNvidia\",\"nvidiaModel\",\"enableGemini\",\"model\",\"enableOpenai\",\"openaiModel\",\"enableGroq\",\"groqModel\",\"enableOpenrouter\",\"openrouterModel\",\"enableDeepseek\",\"deepseekModel\"]}','942f10e6-a399-4d51-81cc-61be193c36bb','2026-09-24 13:04:15'),
('0f7898ef-3329-4faf-9d81-6e345f3799b1','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','PATCH_PLATFORM_TENANT','ai.governance','MEDIUM','FAILURE','PATCH','/api/admin/platform/tenants/f52cabb9-8321-461d-9931-9389b490efed/ai-policy',428,NULL,NULL,'{\"params\":{\"tenantId\":\"f52cabb9-8321-461d-9931-9389b490efed\"},\"query\":{},\"body\":{\"dailyLimit\":50000,\"primaryModel\":\"meta/llama-3.2-11b-vision-instruct\"}}','5da9a69b-961c-4aab-a62e-324cff441b89','2026-11-17 08:21:54'),
('14ed9634-3daf-4881-ac84-af761cddc398','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','cb83b5d7-4f53-4838-a018-0e4e0cd92d89','2026-09-24 13:06:16'),
('16139413-d059-495a-b14e-af033897e2ad','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"mistralai/mistral-large-2-instruct\",\"apiKey\":\"[REDACTED]\"}}','7fe689e0-ac2a-4f63-b52b-b6b2338c30bc','2026-09-23 13:20:25'),
('16372951-d78c-4207-af57-594aa9fefb93','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-23T15:45:02.500Z\"}',NULL,'2026-09-23 15:45:02'),
('17460648-6474-42dd-8ac3-1145e8e96aa5','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','01f53038-ed11-481e-a98b-9105d9304977','2026-09-24 13:16:33'),
('187cb44f-f966-489d-bf75-ffe2d5a1110d','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','80d5e95d-c2e0-4161-ba39-4d1b582f838e','2026-09-24 13:20:37'),
('19c6da16-ed10-4285-8f18-cd000555eed0','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','PUT__OHZDISIFL7EPA1TMKFU9BNR935D3_AI_ENTITLEMENT','ai.governance','MEDIUM','SUCCESS','PUT','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3/ai-entitlement',200,NULL,NULL,'{\"params\":{\"uid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"query\":{},\"body\":{\"dailyLimit\":10000,\"expiresAt\":null,\"reason\":\"Admin quota allocation\"}}','334b8fe9-b3ab-4a66-9b97-c2ad0d29f15e','2026-11-17 08:18:03'),
('1a72d83f-a10a-42c9-a7b1-1a93ab9c5a3a','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs?limit=100',200,NULL,NULL,'{\"params\":{},\"query\":{\"limit\":\"100\"},\"body\":{}}','6f2841d8-0d6f-49db-99d4-508eec426c39','2026-09-25 12:24:23'),
('1c7edcb1-467d-430c-a417-b5d4b9efa58d','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','74f85cf8-cbac-43a8-8726-f5e8afa49cc0','2026-09-24 13:12:23'),
('1d3b2d4c-a460-45a2-9276-9ae08f3f5f9b','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-25T12:28:27.526Z\"}',NULL,'2026-09-25 12:28:27'),
('1e95da7d-70d5-4ed7-9aa3-cdd12e8884ef','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','9770dc77-694e-4887-8198-dc25d2ef4c35','2026-09-24 16:09:49'),
('1f5f5d43-c249-4090-865b-cd6589fe455d','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','27af5732-99df-42e9-994b-eba25224c1eb','2026-11-17 07:09:49'),
('212b8348-d219-4bf6-8664-8e3856fe899c','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','ADMIN','ADMIN_SETTINGS_UPDATED','system.config','HIGH','SUCCESS','POST','/api/admin/settings/modules',200,'PLATFORM_CONFIG','modules','{\"category\":\"modules\",\"revision\":39,\"changedFields\":[\"enableAtsScoreModule\"]}','4d9e6064-b4c9-4b96-8e6f-ff8dcd64bbb7','2026-09-23 13:16:24'),
('22e8a5e0-6f04-4283-b8c8-a797dbc2ff28','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/llama-3.1-nemotron-70b-instruct\",\"apiKey\":\"[REDACTED]\"}}','65af059b-bd40-4af1-94d4-7c64339153e5','2026-11-17 07:20:13'),
('2406f1de-7249-4777-8d1b-8910dd7be1a4','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-10-19T07:55:22.507Z\"}',NULL,'2026-10-19 07:55:22'),
('250d4c59-4f69-4dfa-9c66-e79a69154d91','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs/stats',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{}}','9d5f0182-2c0d-4114-ba79-a5ac50b3ee18','2026-11-17 07:10:03'),
('252e5f34-7468-4146-b76a-4df2d6fe48fa','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/llama-3.1-nemotron-70b-instruct\",\"apiKey\":\"[REDACTED]\"}}','d3ae83de-3ed9-4cad-b539-8fb8cf580aa9','2026-11-17 07:21:41'),
('25b3b115-83d2-40cc-beae-9d4aa5cf01e4','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-11-05T00:49:21.457Z\"}',NULL,'2026-11-05 00:49:21'),
('2854f7e5-7f11-4d27-8a60-20435e07521e','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-10-07T16:38:23.960Z\"}',NULL,'2026-10-07 16:38:23'),
('289e62f0-9008-4153-aa99-7c2ac153b36b','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/llama-3.1-nemotron-70b-instruct\",\"apiKey\":\"[REDACTED]\"}}','9e84dd33-3a15-4a69-94bd-65906c287718','2026-09-23 13:20:02'),
('2aa3a0cf-fcc7-4048-bd2a-8f1181b10493','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-11-16T11:48:02.244Z\"}',NULL,'2026-11-16 11:48:02'),
('2ac9e398-0035-42cf-aaa3-938feeddcc93','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs?limit=100',200,NULL,NULL,'{\"params\":{},\"query\":{\"limit\":\"100\"},\"body\":{}}','af025483-a3e2-4052-a91d-b6ec90ceba0a','2026-10-02 15:14:57'),
('2e3206b7-67f1-4bd1-b23a-600063948a3b','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"meta/llama-3.2-11b-vision-instruct\",\"apiKey\":\"[REDACTED]\"}}','1f5c4aa8-4893-44fa-a7d7-0852d02b7b82','2026-11-17 07:22:48'),
('33d6a57f-ebb4-48c4-ab57-7a3f7df3fc82','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','HIGH','FAILURE','POST','/api/admin/ai/test-provider',502,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/nemotron-3-ultra-550b-a55b\",\"apiKey\":\"[REDACTED]\"}}','2760767f-70db-4652-a5e1-c1530e292d4d','2026-11-17 07:20:22'),
('34c46dcf-eace-4f12-bcdc-d51a857514ee','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','HIGH','FAILURE','POST','/api/admin/ai/test-provider',504,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"openai/gpt-oss-20b\",\"apiKey\":\"[REDACTED]\"}}','1018d83b-390a-411b-8906-a1f994b3b7cb','2026-11-17 07:20:07'),
('3ca44b77-d863-4531-ad56-6bd250acbcd8','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/llama-3.1-nemotron-70b-instruct\",\"apiKey\":\"[REDACTED]\"}}','ef4c9cbe-6c6d-493c-8173-b829a07633e4','2026-11-17 07:19:22'),
('3d34b522-0cf0-4664-93d0-7ebfe4ace3ac','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-26T10:43:13.161Z\"}',NULL,'2026-09-26 10:43:13'),
('411470dc-7333-4ec7-af40-05463f72cdb4','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-11-17T07:46:23.685Z\"}',NULL,'2026-11-17 07:46:23'),
('4549be7d-a956-46d1-9358-f618b9c37f10','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST_AI_SETTINGS','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai-settings',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"enableGemini\":false,\"geminiApiKey\":\"[REDACTED]\",\"model\":\"gemini-2.0-flash\",\"enableNvidia\":true,\"nvidiaApiKey\":\"[REDACTED]\",\"nvidiaModel\":\"auto\",\"nvidiaBaseUrl\":\"https://integrate.api.nvidia.com/v1\",\"enableOpenai\":false,\"openaiApiKey\":\"[REDACTED]\",\"openaiModel\":\"gpt-4o-mini\",\"openaiBaseUrl\":\"\",\"enableGroq\":false,\"groqApiKey\":\"[REDACTED]\",\"groqModel\":\"llama-3.3-70b-versatile\",\"enableOpenrouter\":true,\"openrouterApiKey\":\"[REDACTED]\",\"openrouterModel\":\"auto\",\"enableDeepseek\":false,\"deepseekApiKey\":\"[REDACTED]\",\"deepseekModel\":\"deepseek-chat\",\"enableOllama\":false,\"ollamaBaseUrl\":\"http://localhost:11434/v1\",\"ollamaModel\":\"llama3\",\"temperature\":0.7,\"maxTokens\":\"[REDACTED]\",\"enableFallback\":true,\"enableImportModule\":false,\"clearSecrets\":\"[REDACTED]\",\"expectedRevision\":47}}','80ab323a-9891-45e6-9e4f-46d7569f2d9c','2026-11-17 07:10:01'),
('462327b7-e60e-459e-9650-50035feb06f2','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','2c33f165-7bcb-4b9d-955f-016f8c180527','2026-09-24 13:12:16'),
('47017acf-efcd-42e6-9a50-35183e88bc57','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs/stats',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{}}','a2e0c613-4868-49b9-8181-6e081409d6e3','2026-10-12 16:51:55'),
('493c5397-9e1a-44d2-8eba-2090f6e5b57a','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','75e7757c-ecba-4b71-96b9-17f83495dad5','2026-09-24 13:04:08'),
('4aca8375-9c4f-431f-b221-9017913ec32c','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST_AI_SETTINGS','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai-settings',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"enableGemini\":false,\"geminiApiKey\":\"[REDACTED]\",\"model\":\"gemini-2.0-flash\",\"enableNvidia\":true,\"nvidiaApiKey\":\"[REDACTED]\",\"nvidiaModel\":\"nvidia/nemotron-3.5-bolt-e4b\",\"nvidiaBaseUrl\":\"https://integrate.api.nvidia.com/v1\",\"enableOpenai\":false,\"openaiApiKey\":\"[REDACTED]\",\"openaiModel\":\"gpt-4o-mini\",\"openaiBaseUrl\":\"\",\"enableGroq\":false,\"groqApiKey\":\"[REDACTED]\",\"groqModel\":\"llama-3.3-70b-versatile\",\"enableOpenrouter\":true,\"openrouterApiKey\":\"[REDACTED]\",\"openrouterModel\":\"auto\",\"enableDeepseek\":false,\"deepseekApiKey\":\"[REDACTED]\",\"deepseekModel\":\"deepseek-chat\",\"enableOllama\":false,\"ollamaBaseUrl\":\"http://localhost:11434/v1\",\"ollamaModel\":\"llama3\",\"temperature\":0.7,\"maxTokens\":\"[REDACTED]\",\"enableFallback\":true,\"enableImportModule\":false,\"clearSecrets\":\"[REDACTED]\",\"expectedRevision\":50}}','6d186cc8-fcab-406d-9716-e592648e3a41','2026-11-17 07:23:13'),
('4d7eed05-9e64-4002-9947-ee184bfb41ea','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','HIGH','FAILURE','POST','/api/admin/ai/test-provider',502,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"minimaxai/minimax-m3.1-flash\",\"apiKey\":\"[REDACTED]\"}}','436f2721-7893-4378-9c01-a0beeec35759','2026-11-17 07:21:20'),
('4faafb4b-6f0f-4c0a-ae67-30a9210dc349','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-23T15:16:36.389Z\"}',NULL,'2026-09-23 15:16:36'),
('4fc65a33-7a46-443f-8642-5e3d847db8a8','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST__OHZDISIFL7EPA1TMKFU9BNR935D3_AI_QUOTA_RESET','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3/ai-quota-reset',200,NULL,NULL,'{\"params\":{\"uid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"query\":{},\"body\":{}}','f4398fff-fcbb-4081-b0f7-b1ee960b3fe4','2026-11-17 08:23:48'),
('50840b28-275e-46d0-8a49-a7217971f8f8','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'SUPER_ADMIN','AI_PROVIDER_SETTINGS_UPDATED','ai.governance','HIGH','SUCCESS','POST','/api/admin/ai-settings',200,'system_settings','ai_providers','{\"revision\":51,\"changedFields\":[\"provider\",\"temperature\",\"maxTokens\",\"enableFallback\",\"enableImportModule\",\"enableNvidia\",\"nvidiaModel\",\"enableGemini\",\"model\",\"enableOpenai\",\"openaiModel\",\"enableGroq\",\"groqModel\",\"enableOpenrouter\",\"openrouterModel\",\"enableDeepseek\",\"deepseekModel\"]}','6d186cc8-fcab-406d-9716-e592648e3a41','2026-11-17 07:23:13'),
('512920a0-d18b-4e0a-bf41-52309edbc5d8','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','PATCH_PLATFORM_TENANT','ai.governance','MEDIUM','FAILURE','PATCH','/api/admin/platform/tenants/f52cabb9-8321-461d-9931-9389b490efed/ai-policy',428,NULL,NULL,'{\"params\":{\"tenantId\":\"f52cabb9-8321-461d-9931-9389b490efed\"},\"query\":{},\"body\":{\"dailyLimit\":2500,\"primaryModel\":\"nvidia/nemotron-3.5-bolt-e4b\"}}','9f7f736a-1843-4b89-be7e-102e94bc9e0f','2026-11-17 08:22:35'),
('517290f3-f332-4f1c-bb06-111e4ee530b1','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','0c479bc6-a4b6-49a4-87a9-b0478dfeb1d8','2026-09-24 16:30:18'),
('519b0599-88b9-413c-b1d3-19554183c71b','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs/stats',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{}}','42341fae-d85c-46c8-8f97-12c4dc6d0437','2026-10-02 15:14:57'),
('598f3e91-2a1b-48c2-b942-42ed3f7475e1','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"mistralai/mistral-large-2-instruct\",\"apiKey\":\"[REDACTED]\"}}','127f3433-c8d3-4536-9e39-0cff51476698','2026-11-17 07:22:42'),
('5aa6c241-3da0-47c6-8ab1-a2b5b6639a3f','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','UPDATE_SETTINGS_MODULES','content.media','MEDIUM','SUCCESS','POST','/api/admin/settings/modules',200,NULL,NULL,'{\"params\":{\"category\":\"modules\"},\"query\":{},\"body\":{\"data\":{\"enableMessagesModule\":true},\"expectedRevision\":36,\"clearSecrets\":\"[REDACTED]\"}}','09df36a6-5008-41db-b0c9-3b97ee3f95f1','2026-09-23 13:16:17'),
('5b9d90c7-376e-4a9f-8f1b-63a6691cc5de','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','0770f935-1ece-4965-bd7c-0a8579435db0','2026-09-24 13:03:51'),
('5c6bfb62-cc70-43cc-88be-eea6e43db4fd','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','UPDATE_SETTINGS_MODULES','content.media','MEDIUM','SUCCESS','POST','/api/admin/settings/modules',200,NULL,NULL,'{\"params\":{\"category\":\"modules\"},\"query\":{},\"body\":{\"data\":{\"enableJobTrackerModule\":true},\"expectedRevision\":39,\"clearSecrets\":\"[REDACTED]\"}}','0bb68f99-79a5-467a-8265-7637e70ed1a9','2026-09-23 13:16:38'),
('5cac2c22-9c32-46f0-96cf-850611f843cb','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','f59897ad-ff44-4daf-9515-4fb0faf6185e','2026-09-24 16:09:46'),
('5ddd548e-3bda-45af-b12a-4321ea48081f','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST__OHZDISIFL7EPA1TMKFU9BNR935D3_AI_QUOTA_RESET','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3/ai-quota-reset',200,NULL,NULL,'{\"params\":{\"uid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"query\":{},\"body\":{}}','f39881e7-b905-45f7-9346-cce9b5d89b04','2026-11-17 08:23:45'),
('5e59e2da-1712-4aa0-8c14-20bec3d6edf4','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','9a5eed6e-3e48-4929-af34-34eeb46a788c','2026-11-17 07:10:04'),
('61cfe116-1dc1-432f-a235-b7f2a968058c','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"meta/llama-3.2-11b-vision-instruct\",\"apiKey\":\"[REDACTED]\"}}','c1f27ae7-67b0-4e5d-b067-c48895ff5aca','2026-11-17 07:21:37'),
('63766973-6734-4613-a723-5f8b77b3e38a','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','GET_FIREBASE_CREDENTIALS','platform.security','HIGH','SUCCESS','GET','/api/admin/firebase-service-account',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{}}','94d9edcd-27b1-4142-8fcf-74537150cb2b','2026-10-12 17:01:58'),
('65ba99b8-a796-40cf-afee-60f8b823443a','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','320d3b4c-5495-4dbe-b019-d691dd8976e0','2026-09-24 13:20:26'),
('67ebae16-ccb0-46fb-8eeb-c09872b4de6b','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','5ff9ec69-79a3-484d-b19f-0dd228a51198','2026-09-24 16:30:10'),
('6858ad9a-2ec7-4474-8ec1-784278c15b65','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','41530212-3970-4799-a17f-72181e7c85c7','2026-09-24 13:20:47'),
('698a9eef-6c43-4c75-b8ca-5e7a0cdad484','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-11-17T08:10:13.642Z\"}',NULL,'2026-11-17 08:10:13'),
('6c5cec2b-4c77-4ee7-91bc-293bcfdb8ff6','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','PATCH__OHZDISIFL7EPA1TMKFU9BNR935D3','system.configuration','MEDIUM','SUCCESS','PATCH','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3',200,NULL,NULL,'{\"params\":{\"uid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"query\":{},\"body\":{\"membership\":\"Premium\",\"membershipEnds\":null,\"expectedMembership\":\"Enterprise\",\"expectedRevision\":359}}','4c342c5f-7a7d-4594-85ec-014751eda608','2026-11-17 08:21:00'),
('6d76cc9b-1df3-4f45-8cce-aa5380cb0665','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-25T12:17:45.964Z\"}',NULL,'2026-09-25 12:17:45'),
('6fda2673-2d38-4a39-ad73-c26026d1dcb3','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','69761e8b-7f4a-4d88-a302-92b930760dba','2026-09-24 13:05:57'),
('71209488-ed21-4615-9e63-2f2fde63803f','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','5934d732-4049-43dc-a0bd-521c66229a89','2026-11-17 07:09:41'),
('71874388-3d6e-43c3-b806-a2ac9c0cbcaf','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','670fc8a4-792b-4afe-9d32-c871936015f8','2026-09-24 13:20:53'),
('72ef062f-f4b9-4c1f-b58b-3c6ed581f088','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','83099502-e71c-4193-b46a-c2e32234791d','2026-09-24 13:03:47'),
('7cb4589f-b952-4ada-92c7-2759063bb5dd','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','1102666b-093e-4933-97a2-b9d88143acf5','2026-09-24 14:26:37'),
('8054e238-3ab5-41a7-8f2a-ce41ff63b759','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs/stats',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{}}','9cff1582-9b09-476e-b495-9648e3f004b0','2026-09-25 12:24:23'),
('80a0e9cc-ab0a-400e-96df-0e0b240b7c00','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs?limit=100',200,NULL,NULL,'{\"params\":{},\"query\":{\"limit\":\"100\"},\"body\":{}}','7b69c1a8-583e-4b84-ab92-df6bd3c4c299','2026-10-12 16:51:55'),
('81ad41a7-a5ea-4819-a415-6c6c61390cf9','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','DELETE__OHZDISIFL7EPA1TMKFU9BNR935D3_AI_ENTITLEMENT','ai.governance','HIGH','SUCCESS','DELETE','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3/ai-entitlement',200,NULL,NULL,'{\"params\":{\"uid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"query\":{},\"body\":{}}','fcff5959-7c25-4326-ad1a-07216611046e','2026-11-17 08:23:42'),
('878cbf7c-9dab-4e52-91fd-282adb6867e5','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','GET_FIREBASE_CREDENTIALS','platform.security','HIGH','SUCCESS','GET','/api/admin/firebase-service-account',304,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{}}','189a5572-b470-4bbf-b9e7-17195cbb6731','2026-10-12 17:12:39'),
('87df03d3-56a5-4ddf-9edd-84f361e4df37','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','HIGH','FAILURE','POST','/api/admin/ai/test-provider',502,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/nemotron-3-ultra-550b-a55b\",\"apiKey\":\"[REDACTED]\"}}','5323e804-b420-42cc-bfaa-c1f1eb3bdd2c','2026-11-17 07:21:03'),
('8818173a-d950-45d7-a261-a89c89dd61c7','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-23T15:14:01.564Z\"}',NULL,'2026-09-23 15:14:01'),
('8d163e78-dcd3-457d-a045-c0a707eec189','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','5cc7ad14-d623-424a-942d-1c256f3acd23','2026-11-17 07:21:32'),
('8dd7b0e5-42c6-49bd-8363-dce1ccf0396c','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ENTERPRISE_ROLE_VIEW_SWITCHED','iam.enterprise_roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"ENTERPRISE_VIEWER\",\"isEnterprise\":true,\"tenantId\":\"f52cabb9-8321-461d-9931-9389b490efed\",\"tenantSlug\":\"ime365-org\",\"tenantDisplayName\":\"IME365 Enterprise Organization\",\"switchedAt\":\"2026-09-25T12:25:38.935Z\"}',NULL,'2026-09-25 12:25:38'),
('92d30d5d-f65c-436d-8078-e4c8c353937d','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','b9435ba6-5a20-4861-afe8-33b02194cfd0','2026-09-24 13:19:18'),
('95340e7b-5913-4e17-bdbe-f57e55fee550','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','HIGH','FAILURE','POST','/api/admin/ai/test-provider',504,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"openai/gpt-oss-20b\",\"apiKey\":\"[REDACTED]\"}}','5bd7b9a5-32d9-4deb-8aa9-72d0329d84fd','2026-11-17 07:22:15'),
('96857c91-7ae9-4ad9-9429-ca6d7caf39f9','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','FETCH_AI_MODELS','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/fetch-models',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"apiKey\":\"[REDACTED]\"}}','575c9319-d94c-4ab5-ba92-4e8f1dab69ff','2026-11-17 07:20:07'),
('9e51b62f-00f2-439c-a1ed-860120cb4c06','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST__OHZDISIFL7EPA1TMKFU9BNR935D3_AI_QUOTA_RESET','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3/ai-quota-reset',200,NULL,NULL,'{\"params\":{\"uid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"query\":{},\"body\":{}}','5b730248-0be9-4d28-8505-2d0569ef2a74','2026-11-17 08:18:22'),
('a0ded257-ebd8-4d74-abd0-dd3952732b49','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','5476c41f-64a2-460e-98d3-e84612418ddb','2026-09-24 13:20:44'),
('a2fa90dc-73bd-41c2-a8bc-10cda72cca02','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','e13b653b-f853-4da9-8d87-ac6cd2d4e0f6','2026-09-24 13:05:00'),
('a6b4697c-c3e1-4447-a1dd-d998095e0314','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','UPDATE_SETTINGS_MODULES','content.media','MEDIUM','SUCCESS','POST','/api/admin/settings/modules',200,NULL,NULL,'{\"params\":{\"category\":\"modules\"},\"query\":{},\"body\":{\"data\":{\"enableAtsScoreModule\":true},\"expectedRevision\":38,\"clearSecrets\":\"[REDACTED]\"}}','4d9e6064-b4c9-4b96-8e6f-ff8dcd64bbb7','2026-09-23 13:16:24'),
('a8f00239-46fb-4366-9e02-aa9af0c1fba9','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','381ca4db-fd85-413c-9b58-654b43a0f07a','2026-09-24 13:12:07'),
('aa74f422-5665-42a5-975a-c2693f2de53f','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"google/gemini-2.0-flash-exp:free\",\"apiKey\":\"[REDACTED]\"}}','2ac5a1fd-73cb-4d31-a3b2-47f34a493c81','2026-09-24 13:03:58'),
('ab4b38fc-469b-4fe4-aa05-e8f19412b99a','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-26T13:17:54.133Z\"}',NULL,'2026-09-26 13:17:54'),
('ac33adae-a730-4ec5-83e4-48f4dc92a70b','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','5be7f3ff-cd1e-4114-a6d2-0337cbe6dbb0','2026-09-24 13:04:06'),
('ae4fc373-aff4-4317-8017-03f3ea246b4b','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','READ_AUDIT_LOGS','platform.security','INFO','SUCCESS','GET','/api/admin/audit-logs?limit=100',200,NULL,NULL,'{\"params\":{},\"query\":{\"limit\":\"100\"},\"body\":{}}','69a2cb20-97a6-4097-878d-c8c476c14201','2026-11-17 07:10:03'),
('b13e5928-87c9-4daa-b704-fb9be568685f','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','HIGH','FAILURE','POST','/api/admin/ai/test-provider',500,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/llama-3.1-nemoguard-8b-topic-control\",\"apiKey\":\"[REDACTED]\"}}','002f266c-082b-4189-b478-6603d9d30072','2026-11-17 07:21:27'),
('b2f3ac31-cc4e-4227-8742-81a487d1e0df','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','UPDATE_SETTINGS_MODULES','content.media','MEDIUM','SUCCESS','POST','/api/admin/settings/modules',200,NULL,NULL,'{\"params\":{\"category\":\"modules\"},\"query\":{},\"body\":{\"data\":{\"enableAppliedJobsModule\":true},\"expectedRevision\":37,\"clearSecrets\":\"[REDACTED]\"}}','a99b8111-9371-417a-84a1-62063d73aaac','2026-09-23 13:16:22'),
('c28e3677-505d-487f-b523-3409357b0681','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','USER_ADMIN_UPDATED','iam.users','HIGH','SUCCESS','PATCH','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3',200,'user','OhZdiSIFL7ePA1TMkfu9bnR935D3','{\"before\":{\"role\":\"SUPER_ADMIN\",\"suspended\":false,\"membership\":\"Enterprise\",\"preferredCurrency\":\"INR\",\"displayName\":\"Bhaskar Beyond\"},\"after\":{\"role\":\"SUPER_ADMIN\",\"suspended\":false,\"membership\":\"Premium\",\"preferredCurrency\":\"INR\",\"displayName\":\"Bhaskar Beyond\"}}','4c342c5f-7a7d-4594-85ec-014751eda608','2026-11-17 08:21:00'),
('c3b0964a-c75f-48dc-ba66-13b6cf20a7ac','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','ea316f24-ab9a-435d-b879-1455f749f14c','2026-09-24 13:03:54'),
('c969634a-67dc-41af-80a3-552b79bed329','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-11-17T07:11:02.546Z\"}',NULL,'2026-11-17 07:11:02'),
('c987aa73-2fdd-489d-8014-eec8e9d51368','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"meta/llama-3.2-11b-vision-instruct\",\"apiKey\":\"[REDACTED]\"}}','4d330984-b6ec-4b2b-ba2e-6955b99294ee','2026-11-17 07:19:19'),
('ca9283a6-446e-43d4-8626-c909c33c4c53','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'SUPER_ADMIN','AI_PROVIDER_SETTINGS_UPDATED','ai.governance','HIGH','SUCCESS','POST','/api/admin/ai-settings',200,'system_settings','ai_providers','{\"revision\":48,\"changedFields\":[\"provider\",\"temperature\",\"maxTokens\",\"enableFallback\",\"enableImportModule\",\"enableNvidia\",\"nvidiaModel\",\"enableGemini\",\"model\",\"enableOpenai\",\"openaiModel\",\"enableGroq\",\"groqModel\",\"enableOpenrouter\",\"openrouterModel\",\"enableDeepseek\",\"deepseekModel\"]}','80ab323a-9891-45e6-9e4f-46d7569f2d9c','2026-11-17 07:10:01'),
('cd300ea6-4321-44cb-97c2-238b82190ed2','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','8b4bc568-82ec-4073-b1b5-432277ba42df','2026-09-24 13:19:22'),
('cfeecf05-a540-4660-968f-ceabe3c76406','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','5b682e19-c89f-41fc-9cfa-6aa83e5f7a2d','2026-09-24 13:09:50'),
('d269ff25-bef1-4795-b3e8-2261248cfc8c','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','POST_AI_SETTINGS','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai-settings',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"enableGemini\":false,\"geminiApiKey\":\"[REDACTED]\",\"model\":\"gemini-2.0-flash\",\"enableNvidia\":true,\"nvidiaApiKey\":\"[REDACTED]\",\"nvidiaModel\":\"mistralai/mistral-large-2-instruct\",\"nvidiaBaseUrl\":\"https://integrate.api.nvidia.com/v1\",\"enableOpenai\":false,\"openaiApiKey\":\"[REDACTED]\",\"openaiModel\":\"gpt-4o-mini\",\"openaiBaseUrl\":\"\",\"enableGroq\":false,\"groqApiKey\":\"[REDACTED]\",\"groqModel\":\"llama-3.3-70b-versatile\",\"enableOpenrouter\":true,\"openrouterApiKey\":\"[REDACTED]\",\"openrouterModel\":\"auto\",\"enableDeepseek\":false,\"deepseekApiKey\":\"[REDACTED]\",\"deepseekModel\":\"deepseek-chat\",\"enableOllama\":false,\"ollamaBaseUrl\":\"http://localhost:11434/v1\",\"ollamaModel\":\"llama3\",\"temperature\":0.7,\"maxTokens\":\"[REDACTED]\",\"enableFallback\":true,\"enableImportModule\":false,\"clearSecrets\":\"[REDACTED]\",\"expectedRevision\":49}}','0b4043d5-2201-4403-a2b0-e44e6b1eeb51','2026-11-17 07:20:01'),
('d30df703-1478-48bd-a42a-403ba6fa90e4','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'SUPER_ADMIN','AI_PROVIDER_SETTINGS_UPDATED','ai.governance','HIGH','SUCCESS','POST','/api/admin/ai-settings',200,'system_settings','ai_providers','{\"revision\":49,\"changedFields\":[\"provider\",\"temperature\",\"maxTokens\",\"enableFallback\",\"enableImportModule\",\"enableNvidia\",\"nvidiaModel\",\"enableGemini\",\"model\",\"enableOpenai\",\"openaiModel\",\"enableGroq\",\"groqModel\",\"enableOpenrouter\",\"openrouterModel\",\"enableDeepseek\",\"deepseekModel\"]}','bc7d511a-6750-4c88-8c65-9490f64d7fb6','2026-11-17 07:10:24'),
('d4f9c580-ef5f-4351-8959-7409ddd50816','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ENTERPRISE_ROLE_VIEW_SWITCHED','iam.enterprise_roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"ENTERPRISE_OWNER\",\"isEnterprise\":true,\"tenantId\":\"f52cabb9-8321-461d-9931-9389b490efed\",\"tenantSlug\":\"ime365-org\",\"tenantDisplayName\":\"IME365 Enterprise Organization\",\"switchedAt\":\"2026-10-02T15:15:34.021Z\"}',NULL,'2026-10-02 15:15:34'),
('d5b1523e-fab5-48e3-98a6-0a7e6b6f12fe','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','PATCH_PLATFORM_TENANT','ai.governance','MEDIUM','FAILURE','PATCH','/api/admin/platform/tenants/f52cabb9-8321-461d-9931-9389b490efed/ai-policy',428,NULL,NULL,'{\"params\":{\"tenantId\":\"f52cabb9-8321-461d-9931-9389b490efed\"},\"query\":{},\"body\":{\"dailyLimit\":50000,\"primaryModel\":\"nvidia/nemotron-3.5-bolt-e4b\"}}','b3633978-1743-4353-993f-52d4e97c0916','2026-11-17 08:22:29'),
('d6483cd0-d36a-4806-9120-8e716b3d4de9','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"deepseek/deepseek-r1:free\",\"apiKey\":\"[REDACTED]\"}}','76525c6f-0dad-4311-808c-d7eba1ee80f3','2026-09-24 13:11:55'),
('d855b621-a6d9-4e43-b3a4-40bd0f6a4a7f','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/nemotron-mini-4b-instruct\",\"apiKey\":\"[REDACTED]\"}}','74416d66-7291-4ce6-8a64-ed6552561f33','2026-09-23 13:19:44'),
('dda4856c-07a8-48ca-9080-08e0a07ea7b1','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"openai/gpt-oss-120b\",\"apiKey\":\"[REDACTED]\"}}','f31a3762-cd99-4908-8372-1f3746c107cf','2026-09-23 13:20:19'),
('e1d24ad2-abee-421d-9c33-e412bbdb44e3','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-25T13:11:19.730Z\"}',NULL,'2026-09-25 13:11:19'),
('e2840a0e-70a4-4760-9f03-24126726ccb3','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',422,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','46e6efcb-0558-4743-b4b5-5b87e4707400','2026-09-24 13:04:51'),
('e3254177-01ba-40bf-b7cc-f4e837927ae3','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"openrouter\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','63062f10-c583-442a-b0e4-f81cf7641142','2026-09-24 16:30:18'),
('e52ed630-137b-49a5-80a6-e014ad526b8f','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"nvidia/nemotron-3.5-bolt-e4b\",\"apiKey\":\"[REDACTED]\"}}','6fcde892-4ddb-4e59-9fc2-90a3af4dcd58','2026-11-17 07:23:09'),
('e8398847-59e6-450c-b9e6-8051040c9773','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-11-23T14:45:28.045Z\"}',NULL,'2026-11-23 14:45:28'),
('eb8ffaf9-6b12-487d-adea-6a4fca11830d','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','SUPER_ADMIN_ROLE_VIEW_SWITCHED','iam.roles','INFO','SUCCESS','GET',NULL,200,NULL,NULL,'{\"realActorUid\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"realActorEmail\":\"bhaskar.beyond@gmail.com\",\"targetRole\":\"USER\",\"isEnterprise\":false,\"tenantId\":null,\"tenantSlug\":null,\"tenantDisplayName\":null,\"switchedAt\":\"2026-09-25T13:12:52.384Z\"}',NULL,'2026-09-25 13:12:52'),
('ed94d777-4105-445f-a7cc-136ce51992f3','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','SUCCESS','POST','/api/admin/ai/test-provider',200,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','00282dfa-293e-4046-9563-fc72296783a5','2026-09-24 13:20:20'),
('f38a75eb-dcde-42b9-bc56-58cc7f47ebdd','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','ADMIN','ADMIN_SETTINGS_UPDATED','system.config','HIGH','SUCCESS','POST','/api/admin/settings/modules',200,'PLATFORM_CONFIG','modules','{\"category\":\"modules\",\"revision\":37,\"changedFields\":[\"enableMessagesModule\"]}','09df36a6-5008-41db-b0c9-3b97ee3f95f1','2026-09-23 13:16:17'),
('f520c051-8fbb-42fb-941a-277680d45c93','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','TEST_AI_PROVIDER','ai.governance','MEDIUM','FAILURE','POST','/api/admin/ai/test-provider',410,NULL,NULL,'{\"params\":{},\"query\":{},\"body\":{\"provider\":\"nvidia\",\"model\":\"auto\",\"apiKey\":\"[REDACTED]\"}}','2be2a9ef-8261-410f-8294-0533fc8a9683','2026-11-17 07:10:28'),
('f9e16479-f052-4c5d-855a-e02b61a86ca1','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','USER_ADMIN_UPDATE_REQUESTED','iam.users','HIGH','SUCCESS','PATCH','/api/admin/users/OhZdiSIFL7ePA1TMkfu9bnR935D3',202,'user','OhZdiSIFL7ePA1TMkfu9bnR935D3','{\"before\":{\"role\":\"SUPER_ADMIN\",\"suspended\":false,\"membership\":\"Enterprise\",\"preferredCurrency\":\"INR\",\"displayName\":\"Bhaskar Beyond\"},\"after\":{\"role\":\"SUPER_ADMIN\",\"suspended\":false,\"membership\":\"Premium\",\"preferredCurrency\":\"INR\",\"displayName\":\"Bhaskar Beyond\"}}','4c342c5f-7a7d-4594-85ec-014751eda608','2026-11-17 08:21:00'),
('fd2ab431-f0dd-4675-96a1-f85fef5c5b7e','OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','SUPER_ADMIN','PATCH_PLATFORM_TENANT','ai.governance','MEDIUM','FAILURE','PATCH','/api/admin/platform/tenants/f52cabb9-8321-461d-9931-9389b490efed/ai-policy',428,NULL,NULL,'{\"params\":{\"tenantId\":\"f52cabb9-8321-461d-9931-9389b490efed\"},\"query\":{},\"body\":{\"dailyLimit\":2500,\"primaryModel\":\"nvidia/nemotron-3.5-bolt-e4b\"}}','945c1ee0-c68f-466c-b656-769008ff2f07','2026-11-17 08:22:40');
/*!40000 ALTER TABLE `admin_audit_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ai_usage`
--

DROP TABLE IF EXISTS `ai_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_usage` (
  `day_key` varchar(10) NOT NULL,
  `uid_hash` varchar(40) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `limit_used` int(11) NOT NULL DEFAULT 10,
  `last_used_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`day_key`,`uid_hash`),
  KEY `idx_ai_usage_uid` (`uid`),
  KEY `idx_ai_usage_day` (`day_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_usage`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ai_usage` WRITE;
/*!40000 ALTER TABLE `ai_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_usage` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` varchar(128) NOT NULL,
  `job_id` varchar(128) NOT NULL,
  `employer_id` varchar(128) NOT NULL,
  `applicant_id` varchar(128) NOT NULL,
  `applicant_name` varchar(255) DEFAULT NULL,
  `applicant_email` varchar(255) DEFAULT NULL,
  `applicant_phone` varchar(50) DEFAULT NULL,
  `resume_id` varchar(128) DEFAULT NULL,
  `resume_url` varchar(1024) DEFAULT NULL,
  `cover_letter` mediumtext DEFAULT NULL,
  `status` varchar(50) DEFAULT 'PENDING',
  `rating` int(11) DEFAULT 0,
  `notes` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `extra_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_json`)),
  `revision` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_app_job` (`job_id`),
  KEY `idx_app_applicant` (`applicant_id`),
  KEY `idx_app_employer` (`employer_id`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`applicant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` varchar(128) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `cover_image` varchar(1024) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `author_id` varchar(128) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `published` tinyint(1) DEFAULT 0,
  `published_at` timestamp NULL DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `likes` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revision` int(11) NOT NULL DEFAULT 1,
  `status` varchar(50) DEFAULT 'draft',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_blog_slug` (`slug`),
  KEY `idx_blog_published` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES
('post_ats_guide','How to Beat the ATS in 2026: The Definitive Resume Guide','how-to-beat-ats-2026','Learn how to optimize your resume with keywords, clear hierarchies, and clean typography to score 95%+ on modern Applicant Tracking Systems.','A comprehensive guide to beating modern ATS screening algorithms.',NULL,'ResumePilot Team',NULL,'Career Advice','[\"ATS\",\"Resume\",\"Career\",\"AI\"]',1,NULL,0,0,'2026-08-25 06:21:38','2026-08-25 06:21:38',1,'draft',NULL);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `canonical_documents`
--

DROP TABLE IF EXISTS `canonical_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `canonical_documents` (
  `entity_type` varchar(64) NOT NULL,
  `entity_id` varchar(128) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `revision` int(11) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`entity_type`,`entity_id`),
  KEY `idx_cd_type` (`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canonical_documents`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `canonical_documents` WRITE;
/*!40000 ALTER TABLE `canonical_documents` DISABLE KEYS */;
INSERT INTO `canonical_documents` VALUES
('employer_applications','live-cert-user-a','{\"sampleKey\":\"certification_probe\",\"at\":1787968390203,\"userId\":\"live-cert-user-a\",\"status\":\"pending\",\"submittedAt\":\"2026-08-29T01:53:10.863Z\",\"id\":\"live-cert-user-a\",\"revision\":1,\"createdAt\":\"2026-08-29T01:53:10.863Z\",\"updatedAt\":\"2026-08-29T01:53:10.863Z\"}',1,NULL,'2026-08-29 01:53:10','2026-08-29 01:53:10');
/*!40000 ALTER TABLE `canonical_documents` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` varchar(128) NOT NULL,
  `owner_id` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(1024) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `extra_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_json`)),
  `revision` int(11) NOT NULL DEFAULT 1,
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `idx_company_owner` (`owner_id`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` varchar(128) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `message` mediumtext DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'UNREAD',
  `ip` varchar(64) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_contact_email` (`email`),
  KEY `idx_contact_read` (`is_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `conversation_messages`
--

DROP TABLE IF EXISTS `conversation_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_messages` (
  `id` varchar(128) NOT NULL,
  `conversation_id` varchar(128) NOT NULL,
  `sender_id` varchar(128) NOT NULL,
  `text` text DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_conv_messages_conv_ts` (`conversation_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `conversation_messages` WRITE;
/*!40000 ALTER TABLE `conversation_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `conversation_participants`
--

DROP TABLE IF EXISTS `conversation_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_participants` (
  `conversation_id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`conversation_id`,`user_id`),
  KEY `idx_conv_participants_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_participants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `conversation_participants` WRITE;
/*!40000 ALTER TABLE `conversation_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_participants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` varchar(128) NOT NULL,
  `application_id` varchar(300) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_conversations_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `conversations_legacy_20260827050240`
--

DROP TABLE IF EXISTS `conversations_legacy_20260827050240`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations_legacy_20260827050240` (
  `id` varchar(128) NOT NULL,
  `participant1_id` varchar(128) NOT NULL,
  `participant2_id` varchar(128) NOT NULL,
  `last_message` text DEFAULT NULL,
  `unread_count` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`unread_count`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_conv_p1` (`participant1_id`),
  KEY `idx_conv_p2` (`participant2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations_legacy_20260827050240`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `conversations_legacy_20260827050240` WRITE;
/*!40000 ALTER TABLE `conversations_legacy_20260827050240` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations_legacy_20260827050240` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupon_redemptions`
--

DROP TABLE IF EXISTS `coupon_redemptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_redemptions` (
  `id` varchar(128) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `coupon_code` varchar(64) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `status` varchar(50) DEFAULT 'RESERVED',
  `expires_at` bigint(20) DEFAULT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_redempt_uid` (`uid`),
  KEY `idx_redempt_code` (`coupon_code`),
  CONSTRAINT `coupon_redemptions_ibfk_1` FOREIGN KEY (`coupon_code`) REFERENCES `coupons` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_redemptions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupon_redemptions` WRITE;
/*!40000 ALTER TABLE `coupon_redemptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_redemptions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `code` varchar(64) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT 10,
  `description` text DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `expiry_date` varchar(64) DEFAULT NULL,
  `max_uses` int(11) DEFAULT 0,
  `used_count` int(11) DEFAULT 0,
  `single_use_per_user` tinyint(1) DEFAULT 0,
  `revision` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`code`),
  KEY `idx_coupon_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `covers`
--

DROP TABLE IF EXISTS `covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `covers` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `title` varchar(160) NOT NULL DEFAULT 'Untitled Cover Letter',
  `template` varchar(50) DEFAULT 'Cover1',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_covers_user` (`user_id`),
  CONSTRAINT `covers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `covers` WRITE;
/*!40000 ALTER TABLE `covers` DISABLE KEYS */;
/*!40000 ALTER TABLE `covers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `credit_note_counters`
--

DROP TABLE IF EXISTS `credit_note_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_note_counters` (
  `financial_year` varchar(20) NOT NULL,
  `next_sequence` bigint(20) unsigned NOT NULL DEFAULT 1,
  `revision` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`financial_year`),
  CONSTRAINT `chk_credit_note_counter_positive` CHECK (`next_sequence` >= 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_note_counters`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `credit_note_counters` WRITE;
/*!40000 ALTER TABLE `credit_note_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_note_counters` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `credit_notes`
--

DROP TABLE IF EXISTS `credit_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_notes` (
  `id` varchar(64) NOT NULL,
  `credit_note_number` varchar(16) NOT NULL,
  `credit_note_sequence` bigint(20) unsigned NOT NULL,
  `financial_year` varchar(20) NOT NULL,
  `invoice_id` varchar(64) NOT NULL,
  `payment_order_id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `provider_refund_id` varchar(255) NOT NULL,
  `currency` char(3) NOT NULL,
  `taxable_amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `reason` varchar(500) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `issued_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `provider_refund_reference_type` varchar(16) NOT NULL DEFAULT 'PROVIDER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_credit_note_number` (`credit_note_number`),
  UNIQUE KEY `uq_credit_note_invoice` (`invoice_id`),
  UNIQUE KEY `uq_credit_note_payment_order` (`payment_order_id`),
  UNIQUE KEY `uq_credit_note_financial_sequence` (`financial_year`,`credit_note_sequence`),
  KEY `idx_credit_note_user_issued` (`user_id`,`issued_at`),
  CONSTRAINT `fk_credit_note_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `fk_credit_note_payment_order` FOREIGN KEY (`payment_order_id`) REFERENCES `payment_orders` (`id`),
  CONSTRAINT `fk_credit_note_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chk_credit_note_taxable_positive` CHECK (`taxable_amount` > 0),
  CONSTRAINT `chk_credit_note_tax_nonnegative` CHECK (`tax_amount` >= 0),
  CONSTRAINT `chk_credit_note_total_positive` CHECK (`total_amount` > 0),
  CONSTRAINT `chk_credit_note_refund_reference_type` CHECK (`provider_refund_reference_type` in ('PROVIDER','AGGREGATE'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_notes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `credit_notes` WRITE;
/*!40000 ALTER TABLE `credit_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_notes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `custom_pages`
--

DROP TABLE IF EXISTS `custom_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_pages` (
  `id` varchar(128) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `nav_order` int(11) DEFAULT 0,
  `show_in_nav` tinyint(1) DEFAULT 0,
  `show_in_footer` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` varchar(500) NOT NULL DEFAULT '',
  `status` varchar(16) NOT NULL DEFAULT 'published',
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_cp_slug` (`slug`),
  KEY `idx_cp_published` (`published`),
  CONSTRAINT `chk_custom_page_status` CHECK (`status` in ('draft','published','unpublished'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_pages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `custom_pages` WRITE;
/*!40000 ALTER TABLE `custom_pages` DISABLE KEYS */;
INSERT INTO `custom_pages` VALUES
('page_about','About Us','about','About ResumePilot AI enterprise platform.',1,1,0,1,'2026-08-25 06:21:38','2026-08-25 06:21:38','','published',1),
('page_privacy','Privacy Policy','privacy','Privacy Policy and Data Protection guidelines.',1,3,0,1,'2026-08-25 06:21:38','2026-08-25 06:21:38','','published',1),
('page_terms','Terms of Service','terms','Terms and Conditions for ResumePilot AI.',1,2,0,1,'2026-08-25 06:21:38','2026-08-25 06:21:38','','published',1);
/*!40000 ALTER TABLE `custom_pages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `database_authority`
--

DROP TABLE IF EXISTS `database_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_authority` (
  `id` varchar(32) NOT NULL,
  `generation` int(11) NOT NULL DEFAULT 1,
  `write_engine` varchar(32) NOT NULL DEFAULT 'mysql',
  `mode` varchar(32) NOT NULL DEFAULT 'NORMAL',
  `lease_owner` varchar(128) DEFAULT NULL,
  `lease_expires_at` bigint(20) DEFAULT 0,
  `reason` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_authority`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `database_authority` WRITE;
/*!40000 ALTER TABLE `database_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `database_authority` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `database_engine_state`
--

DROP TABLE IF EXISTS `database_engine_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_engine_state` (
  `id` varchar(32) NOT NULL,
  `active_engine` varchar(32) NOT NULL DEFAULT 'mysql',
  `standby_engine` varchar(32) NOT NULL DEFAULT 'firestore',
  `sync_mode` varchar(32) NOT NULL DEFAULT 'ACTIVE_PASSIVE',
  `last_switched_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_switched_by` varchar(128) DEFAULT NULL,
  `switch_in_progress` tinyint(1) DEFAULT 0,
  `switch_lock_expires_at` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_engine_state`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `database_engine_state` WRITE;
/*!40000 ALTER TABLE `database_engine_state` DISABLE KEYS */;
INSERT INTO `database_engine_state` VALUES
('active_engine','mysql','firestore','ACTIVE_PASSIVE','2026-08-25 18:45:42','bhaskar.beyond@gmail.com',0,0);
/*!40000 ALTER TABLE `database_engine_state` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `database_switch_audit`
--

DROP TABLE IF EXISTS `database_switch_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_switch_audit` (
  `id` varchar(64) NOT NULL,
  `switched_by` varchar(128) NOT NULL,
  `from_engine` varchar(32) NOT NULL,
  `to_engine` varchar(32) NOT NULL,
  `status` varchar(32) NOT NULL,
  `error_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_dbaudit_time` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_switch_audit`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `database_switch_audit` WRITE;
/*!40000 ALTER TABLE `database_switch_audit` DISABLE KEYS */;
INSERT INTO `database_switch_audit` VALUES
('dbs_1787645057008_03gy4i','VERIFIER_AGENT','mysql','firestore','SUCCESS',NULL,'2026-08-25 08:04:17'),
('dbs_1787645057035_e2kp2w','VERIFIER_AGENT','firestore','mysql','SUCCESS',NULL,'2026-08-25 08:04:17'),
('dbs_1787645080858_94t5hr','VERIFIER_AGENT','mysql','firestore','SUCCESS',NULL,'2026-08-25 08:04:40'),
('dbs_1787645080883_26rhz9','VERIFIER_AGENT','firestore','mysql','SUCCESS',NULL,'2026-08-25 08:04:40'),
('dbs_1787645110468_bjnc8y','RESTART_TEST','mysql','firestore','SUCCESS',NULL,'2026-08-25 08:05:10'),
('dbs_1787645112912_cy6mft','RESTART_TEST','firestore','mysql','SUCCESS',NULL,'2026-08-25 08:05:12'),
('dbs_1787645769345_e4rzwv','AUTH_CRUD_VERIFIER','mysql','firestore','SUCCESS',NULL,'2026-08-25 08:16:09'),
('dbs_1787645769528_epuk7s','AUTH_CRUD_VERIFIER','firestore','mysql','SUCCESS',NULL,'2026-08-25 08:16:09'),
('dbs_1787646278464_tf3oxp','VERIFIER_AGENT','mysql','firestore','SUCCESS',NULL,'2026-08-25 08:24:38'),
('dbs_1787646278496_vfkiny','VERIFIER_AGENT','firestore','mysql','SUCCESS',NULL,'2026-08-25 08:24:38'),
('dbs_1787656498750_vix2ko','bhaskar.beyond@gmail.com','firestore','mysql','SUCCESS',NULL,'2026-08-25 11:14:58'),
('dbs_1787657615422_5fks88','bhaskar.beyond@gmail.com','firestore','mysql','SUCCESS',NULL,'2026-08-25 11:33:35'),
('dbs_1787682280970_t4tvrl','bhaskar.beyond@gmail.com','firestore','mysql','SUCCESS',NULL,'2026-08-25 18:24:40'),
('dbs_1787683443110_iacp7j','bhaskar.beyond@gmail.com','firestore','mysql','SUCCESS',NULL,'2026-08-25 18:44:03'),
('dbs_1787683527854_31fcfh','bhaskar.beyond@gmail.com','mysql','firestore','SUCCESS',NULL,'2026-08-25 18:45:27'),
('dbs_1787683542944_1s5f6u','bhaskar.beyond@gmail.com','firestore','mysql','SUCCESS',NULL,'2026-08-25 18:45:42');
/*!40000 ALTER TABLE `database_switch_audit` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_logs`
--

DROP TABLE IF EXISTS `email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_logs` (
  `id` varchar(64) NOT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `template_type` varchar(64) DEFAULT 'custom',
  `status` varchar(32) DEFAULT 'SENT',
  `html` mediumtext DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `error` text DEFAULT NULL,
  `transport` varchar(64) DEFAULT 'primary_smtp',
  `sent_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_email_logs_recipient` (`recipient`),
  KEY `idx_email_logs_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_logs` WRITE;
/*!40000 ALTER TABLE `email_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_verification_state`
--

DROP TABLE IF EXISTS `email_verification_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verification_state` (
  `uid` varchar(128) NOT NULL,
  `active_token_hash` varchar(64) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verification_state`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_verification_state` WRITE;
/*!40000 ALTER TABLE `email_verification_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verification_state` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_verification_tokens`
--

DROP TABLE IF EXISTS `email_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verification_tokens` (
  `token_hash` varchar(64) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `lease_id` varchar(64) DEFAULT NULL,
  `lease_expires_at` bigint(20) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`token_hash`),
  KEY `idx_evt_uid` (`uid`),
  KEY `idx_evt_expiry` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verification_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_verification_tokens` WRITE;
/*!40000 ALTER TABLE `email_verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_ai_usage`
--

DROP TABLE IF EXISTS `enterprise_ai_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_ai_usage` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `principalId` varchar(128) NOT NULL,
  `dayKey` varchar(10) NOT NULL,
  `provider` varchar(80) DEFAULT NULL,
  `model` varchar(128) DEFAULT NULL,
  `operation` varchar(120) DEFAULT NULL,
  `eventKey` char(64) DEFAULT NULL,
  `correlationId` varchar(160) DEFAULT NULL,
  `policyVersion` int(10) unsigned NOT NULL DEFAULT 0,
  `promptTokens` int(11) DEFAULT 0,
  `completionTokens` int(11) DEFAULT 0,
  `totalTokens` int(11) DEFAULT 0,
  `costMicros` bigint(20) unsigned NOT NULL DEFAULT 0,
  `costEstimate` decimal(10,4) DEFAULT 0.0000,
  `recordedAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ent_ai_usage_tenant_event` (`tenantId`,`eventKey`),
  KEY `idx_ent_ai_usage_tenant` (`tenantId`,`dayKey`),
  KEY `fk_ent_ai_workspace` (`tenantId`,`workspaceId`),
  KEY `idx_ent_ai_usage_tenant_recorded` (`tenantId`,`recordedAt`),
  KEY `idx_ent_ai_usage_tenant_provider` (`tenantId`,`provider`),
  CONSTRAINT `fk_ent_ai_tenant` FOREIGN KEY (`tenantId`) REFERENCES `enterprise_tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ent_ai_workspace` FOREIGN KEY (`tenantId`, `workspaceId`) REFERENCES `enterprise_workspaces` (`tenantId`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_ai_usage`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_ai_usage` WRITE;
/*!40000 ALTER TABLE `enterprise_ai_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_ai_usage` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_audit_events`
--

DROP TABLE IF EXISTS `enterprise_audit_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_audit_events` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `actorPrincipalId` varchar(128) NOT NULL,
  `action` varchar(128) NOT NULL,
  `category` varchar(128) DEFAULT 'tenant',
  `severity` varchar(32) DEFAULT 'INFO',
  `outcome` varchar(32) DEFAULT 'SUCCESS',
  `actorType` varchar(32) DEFAULT 'user',
  `subjectId` varchar(128) DEFAULT NULL,
  `requestId` varchar(128) DEFAULT NULL,
  `correlationId` varchar(128) DEFAULT NULL,
  `resourceType` varchar(64) DEFAULT NULL,
  `resourceId` varchar(128) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `occurredAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ent_audit_tenant` (`tenantId`,`occurredAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_audit_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_audit_events` WRITE;
/*!40000 ALTER TABLE `enterprise_audit_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_audit_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_membership_invitations`
--

DROP TABLE IF EXISTS `enterprise_membership_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_membership_invitations` (
  `id` varchar(128) NOT NULL,
  `membershipId` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `principalId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) NOT NULL,
  `recipientEmail` varchar(254) NOT NULL,
  `invitedByPrincipalId` varchar(128) NOT NULL,
  `invitationState` varchar(32) NOT NULL DEFAULT 'PENDING',
  `deliveryState` varchar(40) NOT NULL DEFAULT 'NOTIFICATION_QUEUED',
  `notificationId` varchar(64) DEFAULT NULL,
  `notificationEventId` varchar(300) DEFAULT NULL,
  `queueRevision` int(10) unsigned NOT NULL DEFAULT 1,
  `expiresAt` datetime(6) NOT NULL,
  `invitedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `lastQueuedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `acceptedAt` datetime(6) DEFAULT NULL,
  `revokedAt` datetime(6) DEFAULT NULL,
  `deliveredAt` datetime(6) DEFAULT NULL,
  `lastDeliveryError` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ent_invitation_membership` (`membershipId`),
  UNIQUE KEY `uq_ent_invitation_event` (`notificationEventId`),
  KEY `idx_ent_invitation_tenant_state` (`tenantId`,`invitationState`),
  KEY `idx_ent_invitation_recipient` (`recipientEmail`),
  KEY `idx_ent_invitation_notification` (`notificationId`),
  KEY `idx_ent_invitation_expiry` (`invitationState`,`expiresAt`),
  KEY `fk_ent_invitation_workspace` (`workspaceId`),
  CONSTRAINT `fk_ent_invitation_membership` FOREIGN KEY (`membershipId`) REFERENCES `enterprise_memberships` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ent_invitation_notification` FOREIGN KEY (`notificationId`) REFERENCES `notification_outbox` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ent_invitation_tenant` FOREIGN KEY (`tenantId`) REFERENCES `enterprise_tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ent_invitation_workspace` FOREIGN KEY (`workspaceId`) REFERENCES `enterprise_workspaces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_ent_invitation_state` CHECK (`invitationState` in ('PENDING','ACCEPTED','REVOKED','EXPIRED')),
  CONSTRAINT `chk_ent_invitation_delivery_state` CHECK (`deliveryState` in ('NOTIFICATION_QUEUED','DELIVERY_ATTEMPTED','RETRYING','DELIVERED','DEAD_LETTER','CANCELLED')),
  CONSTRAINT `chk_ent_invitation_queue_revision` CHECK (`queueRevision` >= 1),
  CONSTRAINT `chk_ent_invitation_expiry` CHECK (`expiresAt` > `invitedAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_membership_invitations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_membership_invitations` WRITE;
/*!40000 ALTER TABLE `enterprise_membership_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_membership_invitations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_memberships`
--

DROP TABLE IF EXISTS `enterprise_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_memberships` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `principalId` varchar(128) NOT NULL,
  `canonicalPrincipalId` varchar(128) DEFAULT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `revision` int(11) NOT NULL DEFAULT 1,
  `personalTenant` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ent_membership_tenant_principal` (`tenantId`,`principalId`),
  KEY `idx_ent_mem_tenant` (`tenantId`),
  KEY `idx_ent_mem_principal` (`principalId`),
  KEY `idx_ent_mem_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_memberships`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_memberships` WRITE;
/*!40000 ALTER TABLE `enterprise_memberships` DISABLE KEYS */;
INSERT INTO `enterprise_memberships` VALUES
('f52cabb9-8321-461d-9931-9389b490efed_66e908e4b168fd77de7830618197a321b1b41f4c97ebabd3','f52cabb9-8321-461d-9931-9389b490efed','OhZdiSIFL7ePA1TMkfu9bnR935D3','66e908e4-b168-5d77-9e78-30618197a321','1bc587d6-a858-4c2f-afbb-20953a2b98b6','ACTIVE','[\"TENANT_OWNER\"]',1,1,'2026-08-27 08:15:58','2026-08-27 08:15:58');
/*!40000 ALTER TABLE `enterprise_memberships` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_observability_rollups`
--

DROP TABLE IF EXISTS `enterprise_observability_rollups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_observability_rollups` (
  `id` varchar(64) NOT NULL,
  `lifetimeSamples` bigint(20) unsigned NOT NULL DEFAULT 0,
  `clientErrors` bigint(20) unsigned NOT NULL DEFAULT 0,
  `serverErrors` bigint(20) unsigned NOT NULL DEFAULT 0,
  `authErrors` bigint(20) unsigned NOT NULL DEFAULT 0,
  `aiErrors` bigint(20) unsigned NOT NULL DEFAULT 0,
  `quotaErrors` bigint(20) unsigned NOT NULL DEFAULT 0,
  `lastP50Ms` decimal(12,3) DEFAULT NULL,
  `lastP95Ms` decimal(12,3) DEFAULT NULL,
  `lastP99Ms` decimal(12,3) DEFAULT NULL,
  `windowStartedAt` datetime(3) DEFAULT NULL,
  `windowEndedAt` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_observability_rollups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_observability_rollups` WRITE;
/*!40000 ALTER TABLE `enterprise_observability_rollups` DISABLE KEYS */;
INSERT INTO `enterprise_observability_rollups` VALUES
('global',196,42,0,42,0,0,1.134,1.134,1.134,'2026-11-23 14:55:10.786','2026-11-23 15:25:10.788','2026-11-23 15:25:10.000');
/*!40000 ALTER TABLE `enterprise_observability_rollups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_outbox`
--

DROP TABLE IF EXISTS `enterprise_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_outbox` (
  `id` char(64) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `principalId` varchar(128) NOT NULL,
  `subjectId` varchar(128) DEFAULT NULL,
  `identityIssuer` varchar(32) NOT NULL,
  `actorType` varchar(32) NOT NULL,
  `jobType` varchar(128) NOT NULL,
  `correlationId` varchar(128) DEFAULT NULL,
  `idempotencyKey` varchar(200) NOT NULL,
  `classification` varchar(32) NOT NULL DEFAULT 'PRIVATE',
  `envelope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`envelope`)),
  `status` varchar(32) NOT NULL DEFAULT 'QUEUED',
  `attemptCount` int(10) unsigned NOT NULL DEFAULT 0,
  `maxAttempts` int(10) unsigned NOT NULL DEFAULT 5,
  `nextAttemptAt` datetime(3) NOT NULL,
  `expiresAt` datetime(3) NOT NULL,
  `leaseOwner` varchar(128) DEFAULT NULL,
  `leaseExpiresAt` datetime(3) DEFAULT NULL,
  `lastAttemptAt` datetime(3) DEFAULT NULL,
  `completedAt` datetime(3) DEFAULT NULL,
  `rejectedAt` datetime(3) DEFAULT NULL,
  `dlqAt` datetime(3) DEFAULT NULL,
  `replayedAt` datetime(3) DEFAULT NULL,
  `replayedBy` varchar(128) DEFAULT NULL,
  `lastError` varchar(500) DEFAULT NULL,
  `rejectedReason` varchar(200) DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`result`)),
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ent_outbox_idempotency` (`tenantId`,`idempotencyKey`),
  KEY `idx_ent_outbox_due` (`status`,`nextAttemptAt`,`leaseExpiresAt`),
  KEY `idx_ent_outbox_expiry` (`status`,`expiresAt`),
  KEY `idx_ent_outbox_tenant` (`tenantId`,`status`,`created_at`),
  CONSTRAINT `chk_ent_outbox_status` CHECK (`status` in ('QUEUED','PROCESSING','RETRYING','COMPLETED','DEAD_LETTER','REJECTED'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_outbox`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_outbox` WRITE;
/*!40000 ALTER TABLE `enterprise_outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_outbox` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_principal_tenants`
--

DROP TABLE IF EXISTS `enterprise_principal_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_principal_tenants` (
  `principalId` varchar(128) NOT NULL,
  `personalTenantId` varchar(128) NOT NULL,
  `defaultWorkspaceId` varchar(128) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`principalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_principal_tenants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_principal_tenants` WRITE;
/*!40000 ALTER TABLE `enterprise_principal_tenants` DISABLE KEYS */;
INSERT INTO `enterprise_principal_tenants` VALUES
('OhZdiSIFL7ePA1TMkfu9bnR935D3','f52cabb9-8321-461d-9931-9389b490efed','1bc587d6-a858-4c2f-afbb-20953a2b98b6','2026-08-27 08:15:58','2026-08-27 08:15:58');
/*!40000 ALTER TABLE `enterprise_principal_tenants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_quota_buckets`
--

DROP TABLE IF EXISTS `enterprise_quota_buckets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_quota_buckets` (
  `id` varchar(128) NOT NULL,
  `keyHash` varchar(128) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `expiresAt` bigint(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ent_qb_hash` (`keyHash`),
  KEY `idx_ent_qb_expiry` (`expiresAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_quota_buckets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_quota_buckets` WRITE;
/*!40000 ALTER TABLE `enterprise_quota_buckets` DISABLE KEYS */;
INSERT INTO `enterprise_quota_buckets` VALUES
('05c032484f7642a3701ad92653b9c328eb00b5f3cd5383ff819569d638de266a','05c032484f7642a3701ad92653b9c328eb00b5f3cd5383ff819569d638de266a',1,1795364180372,'2026-11-22 15:16:20'),
('14225c7622e4fac02b385651d95ea3adeb7732ce5642cd1f0a095c63dfe4c8b8','14225c7622e4fac02b385651d95ea3adeb7732ce5642cd1f0a095c63dfe4c8b8',20,1790353766567,'2026-09-24 16:37:54'),
('172f337222c824b1ecef77cb7cc21eb8b3d40831c2d22b05c35c0f7c8becfbe8','172f337222c824b1ecef77cb7cc21eb8b3d40831c2d22b05c35c0f7c8becfbe8',6,1795458644364,'2026-11-23 18:30:44'),
('35387b43eb69fe6d902a80b486b4eeb9d849b62735b25ccb663538e9add1341f','35387b43eb69fe6d902a80b486b4eeb9d849b62735b25ccb663538e9add1341f',3,1790776241359,'2026-09-29 13:57:42'),
('47667cf14a088b05c6b594570633a67a7a5a1a9867084e8dadea3ad3df9bed23','47667cf14a088b05c6b594570633a67a7a5a1a9867084e8dadea3ad3df9bed23',36,1791477525267,'2026-10-07 17:22:27'),
('6654aa7877b1bf6ff70094e4d679518e51ed8552cb1bb3c63a916269f845465a','6654aa7877b1bf6ff70094e4d679518e51ed8552cb1bb3c63a916269f845465a',60,1795531570052,'2026-11-23 15:14:28'),
('6ed6aea5329f994235a0488cec2461a2cfd76c5dce87c658241ccc01a41e333b','6ed6aea5329f994235a0488cec2461a2cfd76c5dce87c658241ccc01a41e333b',120,1794984707142,'2026-11-17 08:38:12'),
('8aeea1cb3c957cb7a3e03df178f2812b1996ce61e979c4dd0be0f435698e5544','8aeea1cb3c957cb7a3e03df178f2812b1996ce61e979c4dd0be0f435698e5544',26,1790425209891,'2026-09-25 13:21:42'),
('b356e7de653d1caf7d2a8e68135166bdeff831ccc9123cb2820ab689890c3a91','b356e7de653d1caf7d2a8e68135166bdeff831ccc9123cb2820ab689890c3a91',41,1792483035180,'2026-10-19 08:15:37'),
('bec674a6f75ae5679d2e841510b393debbe41f5a4c851aa99e4a3868cdcf42ef','bec674a6f75ae5679d2e841510b393debbe41f5a4c851aa99e4a3868cdcf42ef',1,1793126007440,'2026-10-26 18:33:27'),
('c21252b6d7b346da1035d91fe1b256cfdc8f1ee5c0be090594da18616600092b','c21252b6d7b346da1035d91fe1b256cfdc8f1ee5c0be090594da18616600092b',40,1794916113531,'2026-11-16 12:06:56'),
('e14fce35246d2ab6b6f767092044e1fb0472ca22c32c4cfb3a5fe6bfff1b4eed','e14fce35246d2ab6b6f767092044e1fb0472ca22c32c4cfb3a5fe6bfff1b4eed',1,1795446927998,'2026-11-23 15:14:27'),
('edd29f04d0d2c2a27fda5ecc2b86c75841f6322620571013db27ed2a445a7e22','edd29f04d0d2c2a27fda5ecc2b86c75841f6322620571013db27ed2a445a7e22',1,1791395111505,'2026-10-07 16:45:11'),
('fc654e560c4b914955d842233912b652e49b4b2d31f39c18b2eb87d023c1b2d5','fc654e560c4b914955d842233912b652e49b4b2d31f39c18b2eb87d023c1b2d5',5,1792816177339,'2026-10-23 04:34:06');
/*!40000 ALTER TABLE `enterprise_quota_buckets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_resources`
--

DROP TABLE IF EXISTS `enterprise_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_resources` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `resourceType` varchar(64) NOT NULL,
  `classification` varchar(32) DEFAULT 'PRIVATE',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `revision` int(11) DEFAULT 1,
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tenantId`,`resourceType`,`id`),
  KEY `idx_ent_res_ws` (`tenantId`,`workspaceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_resources`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_resources` WRITE;
/*!40000 ALTER TABLE `enterprise_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_resources` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_service_accounts`
--

DROP TABLE IF EXISTS `enterprise_service_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_service_accounts` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `displayName` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT 'ACTIVE',
  `keyId` varchar(128) NOT NULL,
  `keyPrefix` varchar(32) NOT NULL,
  `secretHash` varchar(128) NOT NULL,
  `scopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scopes`)),
  `expiresAt` timestamp NULL DEFAULT NULL,
  `lastUsedAt` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ent_sa_tenant` (`tenantId`),
  KEY `idx_ent_sa_hash` (`secretHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_service_accounts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_service_accounts` WRITE;
/*!40000 ALTER TABLE `enterprise_service_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_service_accounts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_support_grants`
--

DROP TABLE IF EXISTS `enterprise_support_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_support_grants` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `grantedBy` varchar(128) NOT NULL,
  `grantedTo` varchar(128) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'ACTIVE',
  `expiresAt` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `scopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`scopes`)),
  `revokedAt` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ent_sg_tenant` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_support_grants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_support_grants` WRITE;
/*!40000 ALTER TABLE `enterprise_support_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_support_grants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_team_members`
--

DROP TABLE IF EXISTS `enterprise_team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_team_members` (
  `id` varchar(128) NOT NULL,
  `teamId` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `principalId` varchar(128) NOT NULL,
  `role` varchar(50) DEFAULT 'MEMBER',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ent_tm_team` (`teamId`),
  KEY `idx_ent_tm_principal` (`principalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_team_members`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_team_members` WRITE;
/*!40000 ALTER TABLE `enterprise_team_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_team_members` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_teams`
--

DROP TABLE IF EXISTS `enterprise_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_teams` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ent_team_tenant` (`tenantId`),
  KEY `idx_ent_team_ws` (`workspaceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_teams`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_teams` WRITE;
/*!40000 ALTER TABLE `enterprise_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_teams` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_tenant_configurations`
--

DROP TABLE IF EXISTS `enterprise_tenant_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_tenant_configurations` (
  `tenantId` varchar(128) NOT NULL,
  `revision` int(11) NOT NULL DEFAULT 1,
  `customRoles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`customRoles`)),
  `aiPolicy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`aiPolicy`)),
  `quotaPolicy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`quotaPolicy`)),
  `retentionPolicy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`retentionPolicy`)),
  `securityPolicy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`securityPolicy`)),
  `identityPolicy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`identityPolicy`)),
  `commercials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`commercials`)),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_tenant_configurations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_tenant_configurations` WRITE;
/*!40000 ALTER TABLE `enterprise_tenant_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_tenant_configurations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_tenants`
--

DROP TABLE IF EXISTS `enterprise_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_tenants` (
  `id` varchar(128) NOT NULL,
  `slug` varchar(160) NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `lifecycleState` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `isolationTier` varchar(50) NOT NULL DEFAULT 'STANDARD',
  `dataPlane` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dataPlane`)),
  `policyVersion` int(11) NOT NULL DEFAULT 1,
  `legacyOwnerUid` varchar(128) DEFAULT NULL,
  `decommissionedAt` timestamp NULL DEFAULT NULL,
  `purgeScheduledAt` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_ent_tenant_state` (`lifecycleState`),
  KEY `idx_ent_tenant_owner` (`legacyOwnerUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_tenants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_tenants` WRITE;
/*!40000 ALTER TABLE `enterprise_tenants` DISABLE KEYS */;
INSERT INTO `enterprise_tenants` VALUES
('f52cabb9-8321-461d-9931-9389b490efed','ime365-org','IME365 Enterprise Organization','ACTIVE','STANDARD','{\"id\": \"mysql-primary\", \"type\": \"MYSQL\", \"region\": \"default\", \"routingVersion\": 1, \"storageProfile\": \"shared\", \"cacheProfile\": \"shared\", \"queueProfile\": \"mysql-transactional-outbox\", \"aiProfile\": \"platform-default\", \"securityProfile\": \"standard\"}',1,'OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,NULL,'2026-08-27 08:15:58','2026-09-23 12:58:59');
/*!40000 ALTER TABLE `enterprise_tenants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_workspace_memberships`
--

DROP TABLE IF EXISTS `enterprise_workspace_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_workspace_memberships` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `workspaceId` varchar(128) NOT NULL,
  `principalId` varchar(128) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ent_wsmem_ws` (`workspaceId`),
  KEY `idx_ent_wsmem_principal` (`principalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_workspace_memberships`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_workspace_memberships` WRITE;
/*!40000 ALTER TABLE `enterprise_workspace_memberships` DISABLE KEYS */;
INSERT INTO `enterprise_workspace_memberships` VALUES
('1bc587d6-a858-4c2f-afbb-20953a2b98b6_66e908e4b168fd77de7830618197a321b1b41f4c97ebabd3','f52cabb9-8321-461d-9931-9389b490efed','1bc587d6-a858-4c2f-afbb-20953a2b98b6','OhZdiSIFL7ePA1TMkfu9bnR935D3','ACTIVE','2026-08-27 08:15:58','2026-08-27 08:15:58');
/*!40000 ALTER TABLE `enterprise_workspace_memberships` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `enterprise_workspaces`
--

DROP TABLE IF EXISTS `enterprise_workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_workspaces` (
  `id` varchar(128) NOT NULL,
  `tenantId` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lifecycleState` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `isDefault` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ent_workspace_tenant_id` (`tenantId`,`id`),
  KEY `idx_ent_ws_tenant` (`tenantId`),
  KEY `idx_ent_ws_state` (`lifecycleState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_workspaces`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `enterprise_workspaces` WRITE;
/*!40000 ALTER TABLE `enterprise_workspaces` DISABLE KEYS */;
INSERT INTO `enterprise_workspaces` VALUES
('1bc587d6-a858-4c2f-afbb-20953a2b98b6','f52cabb9-8321-461d-9931-9389b490efed','Main Workspace','ACTIVE',1,'2026-08-27 08:15:58','2026-09-23 12:59:42');
/*!40000 ALTER TABLE `enterprise_workspaces` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `export_render_tokens`
--

DROP TABLE IF EXISTS `export_render_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `export_render_tokens` (
  `token_hash` varchar(64) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `expires_at` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `consumed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`token_hash`),
  KEY `idx_export_tokens_expiry` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_render_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `export_render_tokens` WRITE;
/*!40000 ALTER TABLE `export_render_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_render_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `failover_events`
--

DROP TABLE IF EXISTS `failover_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failover_events` (
  `id` varchar(64) NOT NULL,
  `event_type` varchar(32) NOT NULL,
  `from_engine` varchar(32) DEFAULT NULL,
  `to_engine` varchar(32) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_failover_time` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failover_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `failover_events` WRITE;
/*!40000 ALTER TABLE `failover_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `failover_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `item_type` varchar(50) DEFAULT 'resume',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_fav_user_item` (`user_id`,`item_id`),
  KEY `idx_fav_user` (`user_id`),
  KEY `idx_fav_item` (`item_id`),
  CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `invoice_counters`
--

DROP TABLE IF EXISTS `invoice_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_counters` (
  `financial_year` varchar(20) NOT NULL,
  `next_sequence` bigint(20) unsigned NOT NULL DEFAULT 1,
  `revision` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`financial_year`),
  CONSTRAINT `chk_invoice_counter_positive` CHECK (`next_sequence` >= 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_counters`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `invoice_counters` WRITE;
/*!40000 ALTER TABLE `invoice_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_counters` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` varchar(64) NOT NULL,
  `invoice_number` varchar(96) NOT NULL,
  `invoice_sequence` bigint(20) unsigned NOT NULL,
  `financial_year` varchar(20) NOT NULL,
  `payment_order_id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `payment_reference` varchar(255) DEFAULT NULL,
  `payment_status` varchar(32) NOT NULL,
  `currency` char(3) NOT NULL,
  `taxable_amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `issued_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_invoice_number` (`invoice_number`),
  UNIQUE KEY `uq_invoice_payment_order` (`payment_order_id`),
  UNIQUE KEY `uq_invoice_financial_sequence` (`financial_year`,`invoice_sequence`),
  KEY `idx_invoice_user_issued` (`user_id`,`issued_at`),
  CONSTRAINT `fk_invoice_payment_order` FOREIGN KEY (`payment_order_id`) REFERENCES `payment_orders` (`id`),
  CONSTRAINT `fk_invoice_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chk_invoice_taxable_nonnegative` CHECK (`taxable_amount` >= 0),
  CONSTRAINT `chk_invoice_tax_nonnegative` CHECK (`tax_amount` >= 0),
  CONSTRAINT `chk_invoice_total_positive` CHECK (`total_amount` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_tracker`
--

DROP TABLE IF EXISTS `job_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_tracker` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT 'SAVED',
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `location` varchar(255) DEFAULT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `date_applied` varchar(50) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `notes` mediumtext DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `deadline` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_jt_user` (`user_id`),
  KEY `idx_jt_status` (`status`),
  KEY `idx_jt_user_updated` (`user_id`,`updated_at`),
  CONSTRAINT `job_tracker_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_tracker`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_tracker` WRITE;
/*!40000 ALTER TABLE `job_tracker` DISABLE KEYS */;
INSERT INTO `job_tracker` VALUES
('tracker_d9412d72-590c-416a-b377-2e75959b1934','OhZdiSIFL7ePA1TMkfu9bnR935D3','HR Recruiter','Target Company','applied',1,0,'Remote / Hybrid',NULL,NULL,'','[Cover Letter Linked] Formatted using Cover2 template on 17/11/2026.  Preview: ...',NULL,NULL,NULL,'2026-11-17 07:38:32','2026-11-17 07:38:32'),
('tracker_f86ec12c-c1d8-4ac0-ae25-7a383c590c96','OhZdiSIFL7ePA1TMkfu9bnR935D3','Hr Manager','DHub','rejected',4,0,'Hyderabad',NULL,NULL,'https://dhub.in/','Have Shared the resume',NULL,NULL,'2026-11-17','2026-11-17 07:40:35','2026-11-17 07:41:03');
/*!40000 ALTER TABLE `job_tracker` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` varchar(128) NOT NULL,
  `employer_id` varchar(128) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_logo` varchar(1024) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `location` varchar(255) DEFAULT NULL,
  `job_type` varchar(50) DEFAULT 'Full-time',
  `workplace_type` varchar(50) DEFAULT 'Remote',
  `salary_min` int(11) DEFAULT NULL,
  `salary_max` int(11) DEFAULT NULL,
  `salary_currency` varchar(10) DEFAULT 'USD',
  `experience_level` varchar(50) DEFAULT NULL,
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`skills`)),
  `status` varchar(50) DEFAULT 'OPEN',
  `applicants_count` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revision` int(11) NOT NULL DEFAULT 1,
  `extra_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_json`)),
  PRIMARY KEY (`id`),
  KEY `idx_jobs_employer` (`employer_id`),
  KEY `idx_jobs_status` (`status`),
  KEY `idx_jobs_featured` (`featured`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `live_interview_sessions`
--

DROP TABLE IF EXISTS `live_interview_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `live_interview_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `status` varchar(24) NOT NULL DEFAULT 'active',
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  `state_json` mediumtext NOT NULL,
  `expires_at` datetime(3) NOT NULL,
  `completed_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `idx_live_interview_owner_active` (`user_id`,`status`,`updated_at`),
  KEY `idx_live_interview_expiry` (`expires_at`),
  CONSTRAINT `fk_live_interview_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_live_interview_status` CHECK (`status` in ('active','completed'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_interview_sessions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `live_interview_sessions` WRITE;
/*!40000 ALTER TABLE `live_interview_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_interview_sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `messages_legacy_20260827050240`
--

DROP TABLE IF EXISTS `messages_legacy_20260827050240`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages_legacy_20260827050240` (
  `id` varchar(128) NOT NULL,
  `conversation_id` varchar(128) NOT NULL,
  `sender_id` varchar(128) NOT NULL,
  `receiver_id` varchar(128) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_msg_conv` (`conversation_id`),
  KEY `idx_msg_sender` (`sender_id`),
  KEY `idx_msg_receiver` (`receiver_id`),
  CONSTRAINT `messages_legacy_20260827050240_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations_legacy_20260827050240` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_legacy_20260827050240`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `messages_legacy_20260827050240` WRITE;
/*!40000 ALTER TABLE `messages_legacy_20260827050240` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_legacy_20260827050240` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `notification_outbox`
--

DROP TABLE IF EXISTS `notification_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_outbox` (
  `id` varchar(64) NOT NULL,
  `event_id` varchar(300) NOT NULL,
  `channel` varchar(32) NOT NULL DEFAULT 'email',
  `recipient` varchar(255) NOT NULL,
  `template_type` varchar(80) NOT NULL,
  `vars` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vars`)),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `tenant_id` varchar(128) DEFAULT NULL,
  `idempotency_key` varchar(128) DEFAULT NULL,
  `state` varchar(40) NOT NULL DEFAULT 'NOTIFICATION_QUEUED',
  `attempt_count` int(11) NOT NULL DEFAULT 0,
  `max_attempts` int(11) NOT NULL DEFAULT 5,
  `provider_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `provider_accepted_at` timestamp NULL DEFAULT NULL,
  `next_attempt_at` bigint(20) NOT NULL DEFAULT 0,
  `lease_owner` varchar(128) DEFAULT NULL,
  `lease_expires_at` bigint(20) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `last_error` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_notification_idempotency` (`idempotency_key`),
  KEY `idx_notification_due` (`state`,`next_attempt_at`),
  KEY `idx_notification_recipient` (`recipient`),
  KEY `idx_notification_state` (`state`),
  CONSTRAINT `chk_notification_outbox_state` CHECK (`state` in ('NOTIFICATION_QUEUED','DELIVERY_ATTEMPTED','RETRYING','DELIVERED','DEAD_LETTER','CANCELLED'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_outbox`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `notification_outbox` WRITE;
/*!40000 ALTER TABLE `notification_outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_outbox` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `event_id` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT 'system',
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `is_read` tinyint(1) DEFAULT 0,
  `state` varchar(50) DEFAULT 'NOTIFICATION_CREATED',
  `delivery_state` varchar(50) DEFAULT 'NOT_REQUESTED',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_notif_user` (`user_id`),
  KEY `idx_notif_read` (`is_read`),
  KEY `idx_notif_event` (`event_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth_exchange_codes`
--

DROP TABLE IF EXISTS `oauth_exchange_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_exchange_codes` (
  `code_hash` varchar(64) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`code_hash`),
  KEY `idx_oauth_exchange_expiry` (`expires_at`),
  KEY `idx_oauth_exchange_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_exchange_codes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth_exchange_codes` WRITE;
/*!40000 ALTER TABLE `oauth_exchange_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_exchange_codes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth_states`
--

DROP TABLE IF EXISTS `oauth_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_states` (
  `state_hash` varchar(64) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `code_verifier` varchar(255) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`state_hash`),
  KEY `idx_oauth_states_expiry` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_states`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth_states` WRITE;
/*!40000 ALTER TABLE `oauth_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_states` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `password_reset_state`
--

DROP TABLE IF EXISTS `password_reset_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_state` (
  `uid` varchar(128) NOT NULL,
  `active_token_hash` varchar(64) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `consumed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_state`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `password_reset_state` WRITE;
/*!40000 ALTER TABLE `password_reset_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_state` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `token_hash` varchar(64) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `lease_id` varchar(64) DEFAULT NULL,
  `lease_expires_at` bigint(20) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`token_hash`),
  KEY `idx_prt_uid` (`uid`),
  KEY `idx_prt_expiry` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `payment_orders`
--

DROP TABLE IF EXISTS `payment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_orders` (
  `id` varchar(128) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `plan_id` varchar(64) NOT NULL,
  `provider` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL,
  `original_amount` int(11) DEFAULT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'INR',
  `coupon_code` varchar(64) DEFAULT NULL,
  `coupon_discount` int(11) DEFAULT 0,
  `single_use_per_user` tinyint(1) DEFAULT 0,
  `status` varchar(50) DEFAULT 'PENDING_PAYMENT',
  `membership_ends` varchar(64) DEFAULT NULL,
  `provider_payment_id` varchar(255) DEFAULT NULL,
  `provider_order_id` varchar(255) DEFAULT NULL,
  `provider_payment_intent_id` varchar(255) DEFAULT NULL,
  `provider_client_secret` varchar(512) DEFAULT NULL,
  `failure_code` varchar(128) DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `reversed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revision` int(11) NOT NULL DEFAULT 1,
  `mutation_id` varchar(64) DEFAULT NULL,
  `recovery_needed` tinyint(1) NOT NULL DEFAULT 0,
  `recovery_reason` varchar(128) DEFAULT NULL,
  `last_payment_gateway` varchar(64) DEFAULT NULL,
  `provider_refund_id` varchar(255) DEFAULT NULL,
  `refund_claim_id` varchar(64) DEFAULT NULL,
  `refund_claimed_at` datetime(3) DEFAULT NULL,
  `refund_reason` varchar(500) DEFAULT NULL,
  `refund_requested_by` varchar(128) DEFAULT NULL,
  `refund_requested_at` datetime(3) DEFAULT NULL,
  `refund_attempt` int(10) unsigned NOT NULL DEFAULT 0,
  `refund_idempotency_key` varchar(64) DEFAULT NULL,
  `provider_refund_status` varchar(32) DEFAULT NULL,
  `provider_refund_updated_at` datetime(3) DEFAULT NULL,
  `billing_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`billing_snapshot`)),
  `supplier_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`supplier_snapshot`)),
  `billing_snapshot_hash` char(64) DEFAULT NULL,
  `billing_snapshot_version` smallint(5) unsigned DEFAULT NULL,
  `provider_refund_reference_type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_uid` (`uid`),
  KEY `idx_order_status` (`status`),
  KEY `idx_order_provider` (`provider`),
  KEY `idx_payment_refund_claim` (`status`,`refund_claimed_at`),
  KEY `idx_payment_refund_reconciliation` (`status`,`provider_refund_status`,`provider_refund_updated_at`),
  KEY `idx_payment_billing_snapshot` (`billing_snapshot_version`,`status`),
  CONSTRAINT `chk_payment_billing_snapshot_complete` CHECK (`billing_snapshot_version` is null and `billing_snapshot` is null and `supplier_snapshot` is null and `billing_snapshot_hash` is null or `billing_snapshot_version` = 1 and `billing_snapshot` is not null and `supplier_snapshot` is not null and `billing_snapshot_hash` is not null and `billing_snapshot_hash` collate utf8mb4_bin regexp '^[a-f0-9]{64}$'),
  CONSTRAINT `chk_payment_refund_reference_type` CHECK (`provider_refund_reference_type` is null or `provider_refund_reference_type` in ('PROVIDER','AGGREGATE'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_orders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `payment_orders` WRITE;
/*!40000 ALTER TABLE `payment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_orders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `payment_refund_provider_references`
--

DROP TABLE IF EXISTS `payment_refund_provider_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_refund_provider_references` (
  `payment_order_id` varchar(128) NOT NULL,
  `provider` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `provider_refund_id` varchar(255) NOT NULL,
  `provider_status` varchar(32) NOT NULL,
  `amount_minor` bigint(20) unsigned NOT NULL,
  `currency` char(3) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `completed_at` datetime(3) DEFAULT NULL,
  `recorded_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`provider`,`provider_refund_id`),
  KEY `idx_refund_reference_order` (`payment_order_id`,`provider`,`provider_refund_id`),
  KEY `idx_refund_reference_order_status` (`payment_order_id`,`provider_status`),
  CONSTRAINT `fk_refund_reference_order` FOREIGN KEY (`payment_order_id`) REFERENCES `payment_orders` (`id`),
  CONSTRAINT `chk_refund_reference_amount` CHECK (`amount_minor` > 0),
  CONSTRAINT `chk_refund_reference_currency` CHECK (`currency` regexp '^[A-Z]{3}$'),
  CONSTRAINT `chk_refund_reference_type` CHECK (`provider` in ('stripe','paypal','razorpay','paytm','phonepe'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_refund_provider_references`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `payment_refund_provider_references` WRITE;
/*!40000 ALTER TABLE `payment_refund_provider_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_refund_provider_references` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `payment_webhook_events`
--

DROP TABLE IF EXISTS `payment_webhook_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_webhook_events` (
  `event_id` varchar(128) NOT NULL,
  `provider` varchar(64) NOT NULL,
  `event_type` varchar(128) NOT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `received_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`event_id`),
  KEY `idx_pwe_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_webhook_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `payment_webhook_events` WRITE;
/*!40000 ALTER TABLE `payment_webhook_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_webhook_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `platform_announcements`
--

DROP TABLE IF EXISTS `platform_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_announcements` (
  `id` varchar(128) NOT NULL,
  `title` varchar(160) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `severity` varchar(16) NOT NULL DEFAULT 'INFO',
  `audience` varchar(40) NOT NULL DEFAULT 'ALL',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `revision` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_announcements_enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_announcements`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `platform_announcements` WRITE;
/*!40000 ALTER TABLE `platform_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `platform_announcements` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolios` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `title` varchar(160) NOT NULL,
  `slug` varchar(180) DEFAULT NULL,
  `theme` varchar(50) DEFAULT 'modern',
  `is_published` tinyint(1) DEFAULT 0,
  `revision` bigint(20) unsigned NOT NULL DEFAULT 1,
  `published_at` datetime(3) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_portfolios_slug` (`slug`),
  KEY `idx_portfolios_user` (`user_id`),
  KEY `idx_portfolios_public` (`is_published`,`slug`),
  CONSTRAINT `portfolios_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `processed_mutations`
--

DROP TABLE IF EXISTS `processed_mutations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `processed_mutations` (
  `mutation_id` varchar(64) NOT NULL,
  `entity_type` varchar(64) NOT NULL,
  `entity_id` varchar(128) NOT NULL,
  `operation` varchar(32) NOT NULL,
  `source_engine` varchar(32) NOT NULL,
  `processed_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`mutation_id`),
  KEY `idx_processed_entity` (`entity_type`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processed_mutations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `processed_mutations` WRITE;
/*!40000 ALTER TABLE `processed_mutations` DISABLE KEYS */;
/*!40000 ALTER TABLE `processed_mutations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `public_resumes`
--

DROP TABLE IF EXISTS `public_resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `public_resumes` (
  `id` varchar(128) NOT NULL,
  `owner_uid` varchar(128) NOT NULL,
  `is_published` tinyint(1) DEFAULT 0,
  `publication_mode` varchar(50) DEFAULT 'explicit',
  `object` mediumtext DEFAULT NULL,
  `source_revision` int(11) DEFAULT 0,
  `publication_revision` int(11) DEFAULT 1,
  `published_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_pb_owner` (`owner_uid`),
  KEY `idx_pb_published` (`is_published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_resumes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `public_resumes` WRITE;
/*!40000 ALTER TABLE `public_resumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_resumes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `resumes`
--

DROP TABLE IF EXISTS `resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumes` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `title` varchar(160) NOT NULL DEFAULT 'Untitled Resume',
  `template` varchar(64) DEFAULT 'Cv1',
  `revision` int(11) DEFAULT 1,
  `firstname` varchar(120) DEFAULT NULL,
  `lastname` varchar(120) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `targetRole` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postalcode` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `photo` mediumtext DEFAULT NULL,
  `showPhoto` tinyint(1) DEFAULT 1,
  `summary` mediumtext DEFAULT NULL,
  `targetJobDescription` mediumtext DEFAULT NULL,
  `employments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`employments`)),
  `educations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`educations`)),
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`skills`)),
  `languages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`languages`)),
  `hobbies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hobbies`)),
  `projects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`projects`)),
  `certifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`certifications`)),
  `achievements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`achievements`)),
  `references` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`references`)),
  `customSections` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`customSections`)),
  `sectionOrder` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sectionOrder`)),
  `hiddenSections` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hiddenSections`)),
  `completedSteps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`completedSteps`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_resume_user` (`user_id`),
  KEY `idx_resume_updated` (`updated_at`),
  CONSTRAINT `resumes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` VALUES
('res_1790168383027','OhZdiSIFL7ePA1TMkfu9bnR935D3','chef Resume','Cv1',4,'Babu','M','bhaskar.beyond@gmail.com','','chef',NULL,'','','','','','','',NULL,1,'<p class=\"editor-paragraph\" dir=\"ltr\"><span style=\"white-space: pre-wrap;\">HR Recruiter. HR Recruiter. • completed html css making websites. Hr Recruiter, Job Description Writing, Job Posting and Advertising, Candidate Sourcing, Interview Planning and Execution, Reference Checking, Offer Negotiation, Talent Pool Management, Applicant Tracking System (ATS) Management. Certified Professional in Learning and Performance (CPLP) — Association for Talent Development (ATD), Certified Staffing Professional (CSP) — American Staffing Association (ASA), Certified Recruiter (CR) — National Recruitment Federation (NRF). Talent Acquisition: Test</span></p>',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[]','[]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":\"cert_ai_1788877337030_0\",\"title\":\"Certified Professional in Learning and Performance (CPLP)\",\"issuer\":\"Association for Talent Development (ATD)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"\",\"isLicense\":\"\"},{\"id\":\"cert_ai_1788877337030_1\",\"title\":\"Certified Staffing Professional (CSP)\",\"issuer\":\"American Staffing Association (ASA)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"\",\"isLicense\":\"\"},{\"id\":\"cert_ai_1788877337030_2\",\"title\":\"Certified Recruiter (CR)\",\"issuer\":\"National Recruitment Federation (NRF)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"\",\"isLicense\":\"\"}]','[]','[]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[8]','2026-09-23 12:59:43','2026-09-23 13:12:26',NULL),
('res_1790169476554','OhZdiSIFL7ePA1TMkfu9bnR935D3','chef Resume','Cv1',2,'Babu','M','bhaskar.beyond@gmail.com','','chef',NULL,'','','','','','','',NULL,1,'<p class=\"editor-paragraph\" dir=\"ltr\"><span style=\"white-space: pre-wrap;\">HR Recruiter. HR Recruiter. • completed html css making websites. Hr Recruiter, Job Description Writing, Job Posting and Advertising, Candidate Sourcing, Interview Planning and Execution, Reference Checking, Offer Negotiation, Talent Pool Management, Applicant Tracking System (ATS) Management. Certified Professional in Learning and Performance (CPLP) — Association for Talent Development (ATD), Certified Staffing Professional (CSP) — American Staffing Association (ASA), Certified Recruiter (CR) — National Recruitment Federation (NRF). Talent Acquisition: Test</span></p>',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[]','[]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":\"cert_ai_1788877337030_0\",\"title\":\"Certified Professional in Learning and Performance (CPLP)\",\"issuer\":\"Association for Talent Development (ATD)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"\",\"isLicense\":\"\"},{\"id\":\"cert_ai_1788877337030_1\",\"title\":\"Certified Staffing Professional (CSP)\",\"issuer\":\"American Staffing Association (ASA)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"\",\"isLicense\":\"\"},{\"id\":\"cert_ai_1788877337030_2\",\"title\":\"Certified Recruiter (CR)\",\"issuer\":\"National Recruitment Federation (NRF)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"\",\"isLicense\":\"\"}]','[]','[]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[8]','2026-09-23 13:17:57','2026-09-23 13:17:59',NULL),
('res_1790176610502','OhZdiSIFL7ePA1TMkfu9bnR935D3','HR Recruiter Resume','Cv17',25,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','HR Recruiter',NULL,'','','','','','','',NULL,1,'<p class=\"editor-paragraph\" dir=\"ltr\"><span style=\"white-space: pre-wrap;\">HR Recruiter. HR Recruiter. • completed html css making websites. Hr Recruiter, Job Description Writing, Job Posting and Advertising, Candidate Sourcing, Interview Planning and Execution, Reference Checking, Offer Negotiation, Talent Pool Management, Applicant Tracking System (ATS) Management. Certified Professional in Learning and Performance (CPLP) — Association for Talent Development (ATD), Certified Staffing Professional (CSP) — American Staffing Association (ASA), Certified Recruiter (CR) — National Recruitment Federation (NRF). Talent Acquisition: Test</span></p>',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[]','[{\"id\":\"skill_1790176710526_1_gdin\",\"skillName\":\"Talent Pool Management\",\"name\":\"Talent Pool Management\",\"rating\":75,\"date\":1},{\"id\":\"skill_1790176710526_2_6q1n\",\"skillName\":\"Interview Planning and Execution\",\"name\":\"Interview Planning and Execution\",\"rating\":75,\"date\":2},{\"id\":\"skill_1790176710526_3_hla0\",\"skillName\":\"Reference Checking\",\"name\":\"Reference Checking\",\"rating\":100,\"date\":3},{\"id\":\"skill_1790176710526_4_tvc8\",\"skillName\":\"Offer Negotiation\",\"name\":\"Offer Negotiation\",\"rating\":75,\"date\":4},{\"id\":\"skill_1790176710526_5_vq46\",\"skillName\":\"Job Description Writing\",\"name\":\"Job Description Writing\",\"rating\":100,\"date\":5},{\"id\":\"skill_1790176710526_6_z37c\",\"skillName\":\"Applicant Tracking System (ATS) Management\",\"name\":\"Applicant Tracking System (ATS) Management\",\"rating\":100,\"date\":6},{\"id\":\"skill_1790176710526_7_e9gx\",\"skillName\":\"Talent Acquisition\",\"name\":\"Talent Acquisition\",\"rating\":100,\"date\":7},{\"id\":\"skill_1790176710526_8_oxf7\",\"skillName\":\"Recruitment Process Improvement\",\"name\":\"Recruitment Process Improvement\",\"rating\":100,\"date\":8},{\"id\":\"skill_1790176710526_9_kbqi\",\"skillName\":\"HR Metrics and Analytics\",\"name\":\"HR Metrics and Analytics\",\"rating\":100,\"date\":9}]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":1790176768899,\"title\":\"\",\"issuer\":\"\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1790177826970,\"title\":\"SHRM Certified Professional (SHRM-CP)\",\"issuer\":\"Society for Human Resource Management (SHRM)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1790177826919,\"title\":\"Professional in Human Resources (PHR)\",\"issuer\":\"HR Certification Institute (HRCI)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1790177826815,\"title\":\"Talent Acquisition Strategist (TAS)\",\"issuer\":\"Human Capital Institute (HCI)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1790177827511,\"title\":\"Senior Professional in Human Resources (SPHR)\",\"issuer\":\"HR Certification Institute (HRCI)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1790177827660,\"title\":\"Certified Diversity Recruiter (CDR)\",\"issuer\":\"AIRS\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false}]','[]','[]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[4,6,8]','2026-09-23 15:16:49','2026-09-25 13:11:31',NULL),
('res_1790342197093','OhZdiSIFL7ePA1TMkfu9bnR935D3','HR Recruiter Resume','Cv51',46,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','HR Recruiter',NULL,'','','','','','','',NULL,1,'',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[]','[{\"id\":\"skill_1791391280382_1_vu7u\",\"skillName\":\"Job Description Writing\",\"name\":\"Job Description Writing\",\"rating\":100,\"date\":1},{\"id\":\"skill_1791391280382_2_nsa5\",\"skillName\":\"Job Posting and Advertising\",\"name\":\"Job Posting and Advertising\",\"rating\":50,\"date\":2},{\"id\":\"skill_1791391280382_3_gmy6\",\"skillName\":\"Interview Planning and Execution\",\"name\":\"Interview Planning and Execution\",\"rating\":50,\"date\":3},{\"id\":\"skill_1791391280382_4_ssmu\",\"skillName\":\"Reference Checking\",\"name\":\"Reference Checking\",\"rating\":75,\"date\":4},{\"id\":\"skill_1791391280382_5_5rhb\",\"skillName\":\"Talent Pool Management\",\"name\":\"Talent Pool Management\",\"rating\":75,\"date\":5},{\"id\":\"skill_1791391280382_6_7yic\",\"skillName\":\"Applicant Tracking System (ATS) Management\",\"name\":\"Applicant Tracking System (ATS) Management\",\"rating\":50,\"date\":6},{\"id\":\"skill_1791391280382_7_n408\",\"skillName\":\"Learning and Performance\",\"name\":\"Learning and Performance\",\"rating\":75,\"date\":7},{\"id\":\"skill_1791391280382_8_lxj1\",\"skillName\":\"Recruitment\",\"name\":\"Recruitment\",\"rating\":75,\"date\":8}]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":1791391381296,\"title\":\"Professional in Human Resources (PHR)\",\"issuer\":\"Human Resources Certification Institute (HRCI)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791391381134,\"title\":\"SHRM-Certified Professional (SHRM-CP)\",\"issuer\":\"Society for Human Resource Management (SHRM)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791391381252,\"title\":\"Professional in Rec in Talent Certification (PRTRC)\",\"issuer\":\"AIRS (now TalentNet)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791391381276,\"title\":\"Certified Talent Acquisition Recruiter (CTAR)\",\"issuer\":\"HRCI\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791391381252,\"title\":\"Associate Professional in Human Resources (aPHR)\",\"issuer\":\"Human Resources Certification Institute (HRCI)\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791391380783,\"title\":\"Recruiter Management Certification (RCP)\",\"issuer\":\"Various HR Bodies\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false}]','[]','[]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[4,5,6]','2026-09-25 13:16:36','2026-10-07 16:49:42',NULL),
('res_1791392905952','OhZdiSIFL7ePA1TMkfu9bnR935D3','HR Recruiter Resume','Cv1',34,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','Frontend Developer',NULL,'','','','','','','',NULL,1,'',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[]','[{\"id\":\"skill_1791393051726_1_46u1\",\"skillName\":\"HTML\",\"name\":\"HTML\",\"rating\":50,\"date\":1},{\"id\":\"skill_1791393051726_2_4esj\",\"skillName\":\"CSS\",\"name\":\"CSS\",\"rating\":100,\"date\":2},{\"id\":\"skill_1791393051726_3_59mx\",\"skillName\":\"JavaScript\",\"name\":\"JavaScript\",\"rating\":75,\"date\":3},{\"id\":\"skill_1791393051726_4_zrje\",\"skillName\":\"Responsive Design\",\"name\":\"Responsive Design\",\"rating\":25,\"date\":4},{\"id\":\"skill_1791393051726_5_iirs\",\"skillName\":\"React\",\"name\":\"React\",\"rating\":25,\"date\":5},{\"id\":\"skill_1791393051726_6_1dd1\",\"skillName\":\"Git\",\"name\":\"Git\",\"rating\":75,\"date\":6},{\"id\":\"skill_1791393051726_7_jaae\",\"skillName\":\"Web Performance\",\"name\":\"Web Performance\",\"rating\":75,\"date\":7},{\"id\":\"skill_1791393051727_8_7ap9\",\"skillName\":\"UI Development\",\"name\":\"UI Development\",\"rating\":75,\"date\":8},{\"id\":\"skill_1791393051727_9_bsav\",\"skillName\":\"API Integration\",\"name\":\"API Integration\",\"rating\":75,\"date\":9}]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":1791393152417,\"title\":\"Meta Front-End Developer Professional Certificate\",\"issuer\":\"Coursera\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791393152078,\"title\":\"Certified Front-End Web Developer\",\"issuer\":\"W3Schools\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791393152637,\"title\":\"Meta Certified Front-End Developer\",\"issuer\":\"Meta\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791393152279,\"title\":\"React- Front-End Developer Professional Certificate\",\"issuer\":\"Coursera\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791393152333,\"title\":\"Front-End Development Certification\",\"issuer\":\"freeCodeCamp\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false},{\"id\":1791393152317,\"title\":\"JavaScript Certified Associate (JACA)\",\"issuer\":\"OpenED\",\"date\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"url\":\"\",\"certType\":\"Certification\",\"isLicense\":false}]','[]','[]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[4,5,6]','2026-10-07 17:08:26','2026-10-07 17:15:26',NULL),
('res_1791823553652','OhZdiSIFL7ePA1TMkfu9bnR935D3','HR Recruiter Resume','Cv1',5,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','HR Recruiter',NULL,'','','','','','','',NULL,1,'<p class=\"editor-paragraph\" dir=\"ltr\"><span style=\"white-space: pre-wrap;\">HR Recruiter. HR Recruiter. • completed html css making websites. Hr Recruiter, Job Description Writing, Job Posting and Advertising, Candidate Sourcing, Interview Planning and Execution, Reference Checking, Offer Negotiation, Talent Pool Management, Applicant Tracking System (ATS) Management. Certified Professional in Learning and Performance (CPLP) — Association for Talent Development (ATD), Certified Staffing Professional (CSP) — American Staffing Association (ASA), Certified Recruiter (CR) — National Recruitment Federation (NRF). Talent Acquisition: Test</span></p>',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[]','[{\"id\":\"skill_1790689950358_pldxk\",\"name\":\"Talent Acquisition\",\"level\":\"Expert\",\"skillName\":\"Talent Acquisition\",\"rating\":null,\"date\":1},{\"id\":\"skill_1790689950358_8qd1p\",\"name\":\"Staffing\",\"level\":\"Expert\",\"skillName\":\"Staffing\",\"rating\":null,\"date\":2},{\"id\":\"skill_1790689950358_2cwh0\",\"name\":\"Recruitment\",\"level\":\"Expert\",\"skillName\":\"Recruitment\",\"rating\":null,\"date\":3},{\"id\":\"skill_1790689950358_xoj8c\",\"name\":\"Learning and Performance\",\"level\":\"Expert\",\"skillName\":\"Learning and Performance\",\"rating\":null,\"date\":4},{\"id\":\"skill_1790689950358_4wv0p\",\"name\":\"Full-cycle Recruiting\",\"level\":\"Expert\",\"skillName\":\"Full-cycle Recruiting\",\"rating\":null,\"date\":5},{\"id\":\"skill_1790689950358_f13pv\",\"name\":\"Sourcing\",\"level\":\"Expert\",\"skillName\":\"Sourcing\",\"rating\":null,\"date\":6},{\"id\":\"skill_1790689950358_s0bv7\",\"name\":\"Candidate Experience\",\"level\":\"Expert\",\"skillName\":\"Candidate Experience\",\"rating\":null,\"date\":7},{\"id\":\"skill_1790689950358_r7sso\",\"name\":\"Human Resources Administration\",\"level\":\"Expert\",\"skillName\":\"Human Resources Administration\",\"rating\":null,\"date\":8},{\"id\":\"skill_1790689950358_xno2w\",\"name\":\"Interviewing\",\"level\":\"Expert\",\"skillName\":\"Interviewing\",\"rating\":null,\"date\":9},{\"id\":\"skill_1790689950358_i3zz6\",\"name\":\"Talent Pipeline\",\"level\":\"Expert\",\"skillName\":\"Talent Pipeline\",\"rating\":null,\"date\":10},{\"id\":\"skill_1790689950358_3ahk3\",\"name\":\"Employee Relations\",\"level\":\"Expert\",\"skillName\":\"Employee Relations\",\"rating\":null,\"date\":11},{\"id\":\"skill_1790689950358_y8jii\",\"name\":\"Onboarding\",\"level\":\"Expert\",\"skillName\":\"Onboarding\",\"rating\":null,\"date\":12}]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":\"cert_ai_1788877337030_0\",\"title\":\"Certified Professional in Learning and Performance (CPLP)\",\"issuer\":\"Association for Talent Development (ATD)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"true\"},{\"id\":\"cert_ai_1788877337030_1\",\"title\":\"Certified Staffing Professional (CSP)\",\"issuer\":\"American Staffing Association (ASA)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"true\"},{\"id\":\"cert_ai_1788877337030_2\",\"title\":\"Certified Recruiter (CR)\",\"issuer\":\"National Recruitment Federation (NRF)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"true\"}]','[]','[]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[8]','2026-10-12 16:45:53','2026-10-14 06:27:46',NULL),
('res_1792397235523','OhZdiSIFL7ePA1TMkfu9bnR935D3','HR Recruiter Resume','Cv51',17,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','HR Recruiter',NULL,'','','','','','','',NULL,1,'<p class=\"editor-paragraph\" dir=\"ltr\"><span style=\"white-space: pre-wrap;\">HR Recruiter with 2+ years of experience architecting full-cycle recruiting and talent acquisition strategies. Executes comprehensive candidate sourcing, applicant screening, and interviewing while optimizing onboarding and candidate experience. Leverages PHR and SHRM-CP certifications to streamline employment relations and professional job posting processes.</span></p>',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[{\"id\":\"edu_1792396803655\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":1}]','[]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":\"cert_ai_1792396981756_0\",\"title\":\"Professional in Human Resources (PHR)\",\"issuer\":\"Human Resources Certification Institute (HRCI)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1792396981756_1\",\"title\":\"SHRM-Certified Professional (SHRM-CP)\",\"issuer\":\"Society for Human Resource Management (SHRM)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1792396981756_2\",\"title\":\"Certified Professional Recruiter (CPR)\",\"issuer\":\"Professional Talent Acquisition Certification (PTAC)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1792396981756_3\",\"title\":\"Associate Professional in Resources (AIR)\",\"issuer\":\"Human Resources Certification Institute (HRCI)\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1792396981756_4\",\"title\":\"Certified Talent Acquisition Specialist (CTAS)\",\"issuer\":\"HRCI\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1792396981756_5\",\"title\":\"Recruitment Management Professional (RMP)\",\"issuer\":\"Various HR bodies\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"}]','[{\"id\":\"ach_1792397138509\",\"title\":\"\",\"name\":\"\",\"issuer\":\"\",\"awarder\":\"\",\"date\":\"\",\"description\":\"\",\"achievementType\":\"Milestone\"}]','[{\"id\":\"ref_1792397157082\",\"name\":\"Pallavi B\",\"position\":\"CEO\",\"company\":\"Beyond Technologies\",\"email\":\"pallavi@bynd.co.in\",\"phone\":\"+919885220009\",\"reference\":\"\",\"description\":\"\"}]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[5,6,8,10]','2026-10-19 08:07:15','2026-11-23 14:51:42',NULL),
('res_1794830253770','OhZdiSIFL7ePA1TMkfu9bnR935D3','Beyond Technologies','Cv51',45,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','9848766009','HR Recruiter',NULL,'India','Visakhapatnam','','','','','',NULL,1,'HR Recruiter with 2+ years of experience in candidate sourcing, interview scheduling, and offer negotiation. Proficient in Applicant Tracking Systems (ATS), diversity recruitment, and social media recruiting, with certifications including SHRM-CP and Certified Internet Recruiter (CIR).',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"HR Recruiter\",\"company\":\"\",\"city\":\"Visakhapatnam\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"Beyond Technologies\",\"begin\":\"Apr 2015\",\"end\":\"Jan 2026\",\"date\":1}]','[{\"id\":\"edu_1792396803655\",\"degree\":\"Bachelor of Arts in BAIRPM (B.A.)\",\"school\":\"Kennedy Convent \",\"city\":\"Visakhapatnam\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":1,\"fieldOfStudy\":\"Human Resource\"}]','[]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":\"cert_ai_1794830185498_0\",\"title\":\"Professional Recruiter Certification (PRC)\",\"issuer\":\"American Staffing Association\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1794830185498_1\",\"title\":\"Certified Staffing Professional (CSP)\",\"issuer\":\"American Staffing Association\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1794830185499_2\",\"title\":\"Diversity, Equity, and Inclusion in the Workplace Certificate\",\"issuer\":\"University of South Florida\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1794830185499_3\",\"title\":\"SHRM-CP (Society for Human Resource Management Certified Professional)\",\"issuer\":\"SHRM\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1794830185499_4\",\"title\":\"Certified Internet Recruiter (CIR)\",\"issuer\":\"AIRS\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"},{\"id\":\"cert_ai_1794830185499_5\",\"title\":\"Certified Recruitment Specialist (CRS)\",\"issuer\":\"National Association of Personnel Services\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"false\"}]','[{\"id\":\"ach_1792397138509\",\"title\":\"\",\"name\":\"\",\"issuer\":\"\",\"awarder\":\"\",\"date\":\"\",\"description\":\"\",\"achievementType\":\"Milestone\"}]','[{\"id\":\"ref_1792397157082\",\"name\":\"Pallavi B\",\"position\":\"CEO\",\"company\":\"Beyond Technologies\",\"email\":\"pallavi@bynd.co.in\",\"phone\":\"+919885220009\",\"reference\":\"\",\"description\":\"\"}]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[1,2,3]','2026-11-16 11:57:33','2026-11-23 15:08:05',NULL),
('res_1794899889677','OhZdiSIFL7ePA1TMkfu9bnR935D3','DHub','Cv1',8,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','HR Recruiter',NULL,'India','Visakhapatnam','','530013','','','',NULL,1,'HR Recruiter with 2+ years of experience in candidate sourcing, interview scheduling, and offer negotiation. Proficient in Applicant Tracking Systems (ATS), diversity recruitment, and social media recruiting, with certifications including SHRM-CP and Certified Internet Recruiter (CIR).',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[{\"id\":\"edu_1792396803655\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":1},{\"id\":\"edu_1794899055428\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":2},{\"id\":\"edu_1794899057392\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":3}]','[]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[]','[{\"id\":\"ach_1792397138509\",\"title\":\"\",\"name\":\"\",\"issuer\":\"\",\"awarder\":\"\",\"date\":\"\",\"description\":\"\",\"achievementType\":\"Milestone\"}]','[{\"id\":\"ref_1792397157082\",\"name\":\"Pallavi B\",\"position\":\"CEO\",\"company\":\"Beyond Technologies\",\"email\":\"pallavi@bynd.co.in\",\"phone\":\"+919885220009\",\"reference\":\"\",\"description\":\"\"}]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[]','2026-11-17 07:18:09','2026-11-17 07:41:28',NULL),
('res_1794900663835','OhZdiSIFL7ePA1TMkfu9bnR935D3','web Developer Resume','Cv13',27,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','Junior Web Developer',NULL,'India','Visakhapatnam','','530013','','','',NULL,1,'',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[{\"id\":\"edu_1792396803655\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":1},{\"id\":\"edu_1794899055428\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":2},{\"id\":\"edu_1794899057392\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":3}]','[{\"id\":\"skill_1795445331435_1_n2c1\",\"skillName\":\"html\",\"name\":\"html\",\"rating\":100,\"date\":1},{\"id\":\"skill_1795445331435_2_bpde\",\"skillName\":\"css\",\"name\":\"css\",\"rating\":100,\"date\":2}]','[{\"id\":\"lang_1795445435354_1\",\"name\":\"Telugu\",\"level\":\"Full Professional (Fluent)\",\"date\":1,\"language\":\"Telugu\"},{\"id\":\"lang_1795445445003_2\",\"name\":\"English\",\"level\":\"Full Professional (Fluent)\",\"date\":2,\"language\":\"English\"}]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[]','[{\"id\":\"ach_1792397138509\",\"title\":\"\",\"name\":\"\",\"issuer\":\"\",\"awarder\":\"\",\"date\":\"\",\"description\":\"\",\"achievementType\":\"Milestone\"}]','[{\"id\":\"ref_1792397157082\",\"name\":\"Pallavi B\",\"position\":\"CEO\",\"company\":\"Beyond Technologies\",\"email\":\"pallavi@bynd.co.in\",\"phone\":\"+919885220009\",\"reference\":\"CEO\",\"description\":\"\"}]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[4,7,10]','2026-11-17 07:31:04','2026-11-23 14:51:57',NULL),
('res_1794903263840','OhZdiSIFL7ePA1TMkfu9bnR935D3','Bhaskar Beyond (Super Admin)\'s Resume','Cv1',7,'Bhaskar','Beyond (Super Admin)','bhaskar.beyond@gmail.com','','HR Recruiter',NULL,'India','Visakhapatnam','','530013','','','',NULL,1,'HR Recruiter with 2+ years of experience in candidate sourcing, interview scheduling, and offer negotiation. Proficient in Applicant Tracking Systems (ATS), diversity recruitment, and social media recruiting, with certifications including SHRM-CP and Certified Internet Recruiter (CIR).',NULL,'[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\",\"employer\":\"\",\"begin\":\"\",\"end\":\"\",\"date\":1}]','[{\"id\":\"edu_1792396803655\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":1},{\"id\":\"edu_1794899055428\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":2},{\"id\":\"edu_1794899057392\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\",\"started\":\"\",\"finished\":\"\",\"date\":3}]','[]','[]','[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"]','[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"link\":\"\",\"url\":\"\",\"description\":\"Test\"}]','[{\"id\":\"cert_ai_1794900904025_0\",\"title\":\"HTML Certification\",\"issuer\":\"N/A\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"true\"},{\"id\":\"cert_ai_1794900904025_1\",\"title\":\"CSS Certification\",\"issuer\":\"N/A\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"true\"},{\"id\":\"cert_ai_1794901004736_0\",\"title\":\"HR Certification related to Talent Acquisition\",\"issuer\":\"To be verified\",\"date\":\"\",\"url\":\"\",\"link\":\"\",\"endDate\":\"\",\"credentialId\":\"\",\"certType\":\"Certification\",\"isLicense\":\"true\"}]','[{\"id\":\"ach_1792397138509\",\"title\":\"\",\"name\":\"\",\"issuer\":\"\",\"awarder\":\"\",\"date\":\"\",\"description\":\"\",\"achievementType\":\"Milestone\"}]','[{\"id\":\"ref_1792397157082\",\"name\":\"Pallavi B\",\"position\":\"CEO\",\"company\":\"Beyond Technologies\",\"email\":\"pallavi@bynd.co.in\",\"phone\":\"+919885220009\",\"reference\":\"\",\"description\":\"\"}]','[]','[\"heading\",\"employment\",\"education\",\"skills\",\"projects\",\"certifications\",\"languages\",\"summary\",\"achievements\",\"hobbies\",\"references\",\"custom\"]','[]','[]','2026-11-17 08:14:24','2026-11-17 08:20:25',NULL);
/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `avatar` varchar(1024) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `rating` int(11) DEFAULT 5,
  `featured` tinyint(1) DEFAULT 0,
  `status` varchar(50) DEFAULT 'APPROVED',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_reviews_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `schema_migration_attempts`
--

DROP TABLE IF EXISTS `schema_migration_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migration_attempts` (
  `id` char(36) NOT NULL,
  `version` varchar(32) NOT NULL,
  `checksum` char(64) NOT NULL,
  `outcome` varchar(16) NOT NULL,
  `error_message` varchar(500) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL,
  `completed_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_schema_attempt_version` (`version`,`completed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migration_attempts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `schema_migration_attempts` WRITE;
/*!40000 ALTER TABLE `schema_migration_attempts` DISABLE KEYS */;
INSERT INTO `schema_migration_attempts` VALUES
('0a264077-cec6-4564-a8ba-df9b48b4329d','007','1cbe963411d8622b7ab0b0a002598938b12ba3014dadf00f58c11aba45cca78d','APPLIED',NULL,'2026-08-29 01:33:34.768','2026-08-29 01:33:34.774'),
('10c9905c-c556-45f7-830d-eb0b0e0ae528','014','d89e0b641fb526dbe18ea04f2d01b3836c0a71d5f3dfeb2e9731fdf6c4102954','APPLIED',NULL,'2026-08-29 01:33:34.843','2026-08-29 01:33:34.843'),
('370cd4e7-70e8-4eb7-b214-404aa581cb5d','011','28f7920803da9405849666d1dff7782448cdbf1722262162ebc7690eda29d667','APPLIED',NULL,'2026-08-29 01:33:34.792','2026-08-29 01:33:34.804'),
('51ad4395-0f66-4f78-a60f-2206e286d491','004','0a10f12111229cd69af2dbb2d21b26de7ef78b5844a8a9dfafb62bb4a1c98e1d','APPLIED',NULL,'2026-08-29 01:33:34.704','2026-08-29 01:33:34.726'),
('58b0631c-a754-41d2-9a76-1edd4d608e6d','010','f399d1e49983fda145d34b74c77d4eb5a42880de3732e18e60419c3f053ddf38','APPLIED',NULL,'2026-08-29 01:33:34.785','2026-08-29 01:33:34.792'),
('591c00f5-1c9e-4726-b836-9bfd38dc35fd','003','58126b90b1acc8a5994c1e2161e2d314d8ea6cb2851e0c586d48fb669c8de6ea','APPLIED',NULL,'2026-08-29 01:33:34.697','2026-08-29 01:33:34.704'),
('8de51d9e-1c8a-4cb8-8438-f4d26f08355d','005','5b71976f25a2fed59ed82ecb0c922f484a19f86968035e9090a188d269868c19','APPLIED',NULL,'2026-08-29 01:33:34.727','2026-08-29 01:33:34.741'),
('8e62d139-fb59-4e0e-a590-12f348cde2c4','016','f0ebe1df06f377d9d184573a73587b6b1cd407b39bae52f5721dd20f4847b5d7','APPLIED',NULL,'2026-09-21 05:28:27.537','2026-09-21 05:28:27.550'),
('91a3d272-c6d9-4278-acac-36a97cf5e7e7','015','2e05266bb178002b16e298aaec717d29c750ffc7c404cf4776bf0d74c7409f77','APPLIED',NULL,'2026-08-29 11:54:57.838','2026-08-29 11:54:57.847'),
('a65ecc17-8af0-48a7-8eed-a99b2f1389bb','008','03ce5a95d47b0e8946d48add00124e1c616a1c31e2b9be1a6fa9392d26358d2f','APPLIED',NULL,'2026-08-29 01:33:34.775','2026-08-29 01:33:34.781'),
('ae200b7f-e974-4a39-80fd-70628c83cdf0','001','16206ea7fcafb30cfa8a90b90d4c86784e7441e2083020be2fdda4f45a600ec2','APPLIED',NULL,'2026-08-29 01:33:34.637','2026-08-29 01:33:34.664'),
('b3c09539-0b42-4b53-bdff-224774309cd0','009','31e1ad16cbecfdfa01098815a7553a7abe40153e9e389519e98e4231bb91252a','APPLIED',NULL,'2026-08-29 01:33:34.781','2026-08-29 01:33:34.785'),
('b9a1f87d-3337-4c55-8d23-4362df5e2f0e','013','d636336b05c0da51d684425ac0740a923816724915d90740d71df67a4955f06b','APPLIED',NULL,'2026-08-29 01:33:34.827','2026-08-29 01:33:34.842'),
('c603911e-1c49-4af7-9fb2-09e202d7f576','012','915c2564a1b20b9bce166ffd224f2256ac75158ea60518e5a70a62a9741cba1b','APPLIED',NULL,'2026-08-29 01:33:34.804','2026-08-29 01:33:34.827'),
('c876e816-27ff-48ba-89a3-c81603cd0798','006','6a56bf564c16911a62839e31ebf3906d89a701e9c0d2c1dde6846172874bda99','APPLIED',NULL,'2026-08-29 01:33:34.741','2026-08-29 01:33:34.767'),
('de441fb1-5626-4274-9ec7-5ec5e8f786ba','002','a684473b8ae4e198ef9b32e12d37e46e40f4f70a59ab6db302ba861883d03142','APPLIED',NULL,'2026-08-29 01:33:34.666','2026-08-29 01:33:34.697');
/*!40000 ALTER TABLE `schema_migration_attempts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(32) NOT NULL,
  `name` varchar(160) NOT NULL,
  `checksum` char(64) NOT NULL,
  `execution_ms` int(10) unsigned NOT NULL,
  `applied_by` varchar(128) NOT NULL,
  `applied_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES
('001','baseline','16206ea7fcafb30cfa8a90b90d4c86784e7441e2083020be2fdda4f45a600ec2',27,'application-bootstrap','2026-08-29 01:33:34.664'),
('002','single_owner_enterprise','a684473b8ae4e198ef9b32e12d37e46e40f4f70a59ab6db302ba861883d03142',31,'application-bootstrap','2026-08-29 01:33:34.697'),
('003','billing_invoice_ledger','58126b90b1acc8a5994c1e2161e2d314d8ea6cb2851e0c586d48fb669c8de6ea',6,'application-bootstrap','2026-08-29 01:33:34.703'),
('004','single_owner_runtime_hardening','0a10f12111229cd69af2dbb2d21b26de7ef78b5844a8a9dfafb62bb4a1c98e1d',22,'application-bootstrap','2026-08-29 01:33:34.726'),
('005','enterprise_invitation_outbox','5b71976f25a2fed59ed82ecb0c922f484a19f86968035e9090a188d269868c19',14,'application-bootstrap','2026-08-29 01:33:34.741'),
('006','enterprise_ai_usage_ledger','6a56bf564c16911a62839e31ebf3906d89a701e9c0d2c1dde6846172874bda99',26,'application-bootstrap','2026-08-29 01:33:34.767'),
('007','job_tracker_revision','1cbe963411d8622b7ab0b0a002598938b12ba3014dadf00f58c11aba45cca78d',6,'application-bootstrap','2026-08-29 01:33:34.774'),
('008','notification_outbox_state_constraint','03ce5a95d47b0e8946d48add00124e1c616a1c31e2b9be1a6fa9392d26358d2f',6,'application-bootstrap','2026-08-29 01:33:34.781'),
('009','authoritative_configuration_bootstrap','31e1ad16cbecfdfa01098815a7553a7abe40153e9e389519e98e4231bb91252a',4,'application-bootstrap','2026-08-29 01:33:34.785'),
('010','payment_refund_state_machine','f399d1e49983fda145d34b74c77d4eb5a42880de3732e18e60419c3f053ddf38',7,'application-bootstrap','2026-08-29 01:33:34.792'),
('011','refund_reconciliation_credit_notes','28f7920803da9405849666d1dff7782448cdbf1722262162ebc7690eda29d667',12,'application-bootstrap','2026-08-29 01:33:34.804'),
('012','billing_snapshot_refund_references','915c2564a1b20b9bce166ffd224f2256ac75158ea60518e5a70a62a9741cba1b',22,'application-bootstrap','2026-08-29 01:33:34.826'),
('013','cms_relational_authority','d636336b05c0da51d684425ac0740a923816724915d90740d71df67a4955f06b',15,'application-bootstrap','2026-08-29 01:33:34.842'),
('014','fail_closed_discovery_defaults','d89e0b641fb526dbe18ea04f2d01b3836c0a71d5f3dfeb2e9731fdf6c4102954',0,'application-bootstrap','2026-08-29 01:33:34.843'),
('015','support_tickets','2e05266bb178002b16e298aaec717d29c750ffc7c404cf4776bf0d74c7409f77',8,'application-bootstrap','2026-08-29 11:54:57.846'),
('016','resume_target_role_and_job_description','f0ebe1df06f377d9d184573a73587b6b1cd407b39bae52f5721dd20f4847b5d7',12,'application-bootstrap','2026-09-21 05:28:27.549');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `security_audit_logs`
--

DROP TABLE IF EXISTS `security_audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_audit_logs` (
  `id` varchar(128) NOT NULL,
  `actor_uid` varchar(128) NOT NULL,
  `actor_email` varchar(255) DEFAULT NULL,
  `actor_role` varchar(64) DEFAULT NULL,
  `target_uid` varchar(128) DEFAULT NULL,
  `action` varchar(128) NOT NULL,
  `category` varchar(128) DEFAULT 'iam.users',
  `severity` varchar(32) DEFAULT 'MEDIUM',
  `outcome` varchar(32) NOT NULL DEFAULT 'SUCCESS',
  `method` varchar(16) DEFAULT NULL,
  `pathname` varchar(512) DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `ip_address` varchar(64) DEFAULT NULL,
  `user_agent` varchar(512) DEFAULT NULL,
  `target_type` varchar(64) DEFAULT 'USER',
  `target_id` varchar(128) DEFAULT NULL,
  `changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`changes`)),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `request_id` varchar(128) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sec_actor` (`actor_uid`),
  KEY `idx_sec_target` (`target_uid`),
  KEY `idx_sec_action` (`action`),
  KEY `idx_sec_created` (`created_at`),
  KEY `idx_sec_category_created` (`category`,`created_at`),
  KEY `idx_sec_request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_audit_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `security_audit_logs` WRITE;
/*!40000 ALTER TABLE `security_audit_logs` DISABLE KEYS */;
INSERT INTO `security_audit_logs` VALUES
('23963fb8-7c25-48d5-98b1-be495b772e66','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,NULL,'OhZdiSIFL7ePA1TMkfu9bnR935D3','USER_AI_QUOTA_RESET','ai.governance','MEDIUM','SUCCESS',NULL,NULL,NULL,NULL,NULL,'USER','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'{\"before\":null,\"after\":null,\"usageReset\":true,\"usageRowsDeleted\":0}','f39881e7-b905-45f7-9346-cce9b5d89b04','2026-11-17 08:23:45'),
('2461b40f-eb83-44ac-8ceb-df1ec9505f9f','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,NULL,'OhZdiSIFL7ePA1TMkfu9bnR935D3','USER_AI_QUOTA_OVERRIDE_SET','ai.governance','MEDIUM','SUCCESS',NULL,NULL,NULL,NULL,NULL,'USER','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'{\"before\":null,\"after\":{\"dailyLimit\":10000,\"maxTokens\":4096,\"expiresAt\":null,\"reason\":\"Admin quota allocation\",\"grantedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"grantedAt\":\"2026-11-17T08:18:03.643Z\"},\"usageReset\":false,\"usageRowsDeleted\":0}','334b8fe9-b3ab-4a66-9b97-c2ad0d29f15e','2026-11-17 08:18:03'),
('49093719-b20a-4d01-9094-3658b55e9c57','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,NULL,'OhZdiSIFL7ePA1TMkfu9bnR935D3','USER_AI_QUOTA_RESET','ai.governance','MEDIUM','SUCCESS',NULL,NULL,NULL,NULL,NULL,'USER','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'{\"before\":null,\"after\":null,\"usageReset\":true,\"usageRowsDeleted\":0}','f4398fff-fcbb-4081-b0f7-b1ee960b3fe4','2026-11-17 08:23:48'),
('92360705-0071-4767-92f0-f9b82a09ea3a','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,NULL,'OhZdiSIFL7ePA1TMkfu9bnR935D3','USER_AI_QUOTA_RESET','ai.governance','MEDIUM','SUCCESS',NULL,NULL,NULL,NULL,NULL,'USER','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'{\"before\":{\"dailyLimit\":10000,\"maxTokens\":4096,\"expiresAt\":null,\"reason\":\"Admin quota allocation\",\"grantedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"grantedAt\":\"2026-11-17T08:18:03.643Z\"},\"after\":{\"dailyLimit\":10000,\"maxTokens\":4096,\"expiresAt\":null,\"reason\":\"Admin quota allocation\",\"grantedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"grantedAt\":\"2026-11-17T08:18:03.643Z\"},\"usageReset\":true,\"usageRowsDeleted\":0}','5b730248-0be9-4d28-8505-2d0569ef2a74','2026-11-17 08:18:22'),
('f53bc75d-8949-4b7a-bf5a-4c17f4ea5dfb','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,NULL,'OhZdiSIFL7ePA1TMkfu9bnR935D3','USER_AI_QUOTA_OVERRIDE_REMOVED','ai.governance','MEDIUM','SUCCESS',NULL,NULL,NULL,NULL,NULL,'USER','OhZdiSIFL7ePA1TMkfu9bnR935D3',NULL,'{\"before\":{\"dailyLimit\":10000,\"maxTokens\":4096,\"expiresAt\":null,\"reason\":\"Admin quota allocation\",\"grantedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"grantedAt\":\"2026-11-17T08:18:03.643Z\"},\"after\":null,\"usageReset\":false,\"usageRowsDeleted\":0}','fcff5959-7c25-4326-ad1a-07216611046e','2026-11-17 08:23:42');
/*!40000 ALTER TABLE `security_audit_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `id` varchar(64) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES
('earnings','{\"amount\":499,\"currency\":\"INR\"}','2026-08-25 18:30:25'),
('global_stats','{\"login_events\":32,\"documents_downloaded\":15,\"downloads\":15}','2026-11-23 14:45:58'),
('stats','{\"numberOfUsers\":10,\"numberOfResumesCreated\":47,\"numberOfResumesDownloaded\":124}','2026-08-25 18:30:25');
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `type` varchar(64) DEFAULT 'PRO',
  `payment_type` varchar(128) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sub_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `support_ticket_messages`
--

DROP TABLE IF EXISTS `support_ticket_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket_messages` (
  `id` varchar(64) NOT NULL,
  `ticket_id` varchar(64) NOT NULL,
  `author_uid` varchar(128) NOT NULL,
  `author_role` varchar(32) NOT NULL DEFAULT 'USER',
  `body` text NOT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `idx_support_ticket_messages_ticket` (`ticket_id`,`created_at`),
  CONSTRAINT `fk_support_ticket_messages_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_support_ticket_message_role` CHECK (`author_role` in ('USER','SUPPORT','ADMIN','SUPER_ADMIN'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `support_ticket_messages` WRITE;
/*!40000 ALTER TABLE `support_ticket_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_ticket_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `status` varchar(24) NOT NULL DEFAULT 'OPEN',
  `priority` varchar(16) NOT NULL DEFAULT 'NORMAL',
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `idx_support_tickets_user` (`user_id`,`updated_at`),
  KEY `idx_support_tickets_status` (`status`,`updated_at`),
  CONSTRAINT `fk_support_tickets_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chk_support_ticket_status` CHECK (`status` in ('OPEN','PENDING','RESOLVED','CLOSED')),
  CONSTRAINT `chk_support_ticket_priority` CHECK (`priority` in ('LOW','NORMAL','HIGH','URGENT'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sync_conflicts`
--

DROP TABLE IF EXISTS `sync_conflicts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_conflicts` (
  `id` varchar(64) NOT NULL,
  `entity_type` varchar(64) NOT NULL,
  `entity_id` varchar(128) NOT NULL,
  `mysql_version` int(11) DEFAULT NULL,
  `firestore_version` int(11) DEFAULT NULL,
  `mysql_hash` varchar(64) DEFAULT NULL,
  `firestore_hash` varchar(64) DEFAULT NULL,
  `mysql_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`mysql_payload`)),
  `firestore_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`firestore_payload`)),
  `resolution` varchar(32) NOT NULL DEFAULT 'PENDING',
  `resolved_by` varchar(128) DEFAULT NULL,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_conflict_entity` (`entity_type`,`entity_id`),
  KEY `idx_conflict_status` (`resolution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_conflicts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sync_conflicts` WRITE;
/*!40000 ALTER TABLE `sync_conflicts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_conflicts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sync_outbox`
--

DROP TABLE IF EXISTS `sync_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_outbox` (
  `id` varchar(64) NOT NULL,
  `entity_type` varchar(64) NOT NULL,
  `entity_id` varchar(128) NOT NULL,
  `operation` varchar(32) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `version` int(11) NOT NULL DEFAULT 1,
  `source_engine` varchar(32) NOT NULL DEFAULT 'mysql',
  `content_hash` varchar(64) NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'PENDING',
  `retry_count` int(11) NOT NULL DEFAULT 0,
  `max_retries` int(11) NOT NULL DEFAULT 5,
  `last_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `processed_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mutation_id` varchar(64) DEFAULT NULL,
  `idempotency_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_outbox_status_time` (`status`,`created_at`),
  KEY `idx_outbox_entity` (`entity_type`,`entity_id`),
  KEY `idx_outbox_hash` (`content_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_outbox`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sync_outbox` WRITE;
/*!40000 ALTER TABLE `sync_outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_outbox` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sync_tombstones`
--

DROP TABLE IF EXISTS `sync_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_tombstones` (
  `entity_type` varchar(64) NOT NULL,
  `entity_id` varchar(128) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `mutation_id` varchar(64) NOT NULL,
  `source_engine` varchar(32) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`entity_type`,`entity_id`),
  KEY `idx_tombstone_mutation` (`mutation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_tombstones`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sync_tombstones` WRITE;
/*!40000 ALTER TABLE `sync_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_tombstones` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sync_worker_state`
--

DROP TABLE IF EXISTS `sync_worker_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_worker_state` (
  `worker_id` varchar(64) NOT NULL,
  `worker_pid` int(11) NOT NULL,
  `worker_status` varchar(32) NOT NULL DEFAULT 'RUNNING',
  `last_heartbeat_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_sync_started_at` timestamp NULL DEFAULT NULL,
  `last_sync_completed_at` timestamp NULL DEFAULT NULL,
  `last_successful_event_at` timestamp NULL DEFAULT NULL,
  `last_failed_event_at` timestamp NULL DEFAULT NULL,
  `consecutive_failures` int(11) NOT NULL DEFAULT 0,
  `total_events_processed` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_worker_state`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sync_worker_state` WRITE;
/*!40000 ALTER TABLE `sync_worker_state` DISABLE KEYS */;
INSERT INTO `sync_worker_state` VALUES
('primary_sync_worker',293045,'STOPPED','2026-08-26 12:56:14',NULL,'2026-08-26 07:51:29','2026-08-26 07:51:29','2026-08-26 06:59:07',0,72,'2026-08-25 08:08:25');
/*!40000 ALTER TABLE `sync_worker_state` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_settings` (
  `category` varchar(128) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `revision` int(11) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES
('admin_configuration','{\"_revisions\":{\"modules\":40,\"auth\":12,\"socialAuth\":16,\"llmGeo\":1},\"auth\":{\"enableEmailVerification\":false},\"socialAuth\":{\"githubClientSecret\":\"\",\"linkedinClientSecret\":\"\",\"githubClientId\":\"\",\"linkedinClientId\":\"\",\"enableGithubLogin\":false,\"enableLinkedinLogin\":false},\"modules\":{\"enablePublicSharingModule\":true,\"enableEmailVerification\":false,\"enableImportModule\":false,\"enableCouponsModule\":true,\"enableAiSuggestionsModule\":true,\"enableCoverLetterModule\":true,\"enableSalesTaxModule\":true,\"enableGoogleAuthModule\":true,\"enableAtsScoreModule\":true,\"enableGithubAuthModule\":false,\"enableGithubLogin\":false,\"enableLinkedinAuthModule\":false,\"enableLinkedinLogin\":false,\"enableFacebookAuthModule\":false,\"enablePortfolioModule\":false,\"enableJobScraperModule\":false,\"enableMessagesModule\":true,\"enableJobTrackerModule\":true,\"enableAppliedJobsModule\":true},\"twilio\":{\"_revision\":1,\"enableSmsAlerts\":false},\"llmGeo\":{\"enableLlmGeo\":true,\"aiModelOptimization\":\"ChatGPT, Perplexity, Gemini, Claude\",\"llmsTxtContent\":\"# ResumePilot AI > Browser-based resume and career-document application.  Website: https://airesume.projectdemo.guru  ## Product scope - Guided resume and cover-letter editing - Registered resume and cover-letter layouts - Resume preview and supported export workflows - Optional AI-assisted writing and job tools when enabled by an operator - Firebase Authentication for identity and MariaDB for application data  ## Accuracy note Features, payment providers, pricing, and regional availability depend on current runtime configuration. Consult the website for current details. This document does not assert rankings, ratings, employment outcomes, or crawler endorsement.\",\"allowGptBot\":true,\"allowClaudeBot\":true,\"allowGeminiBot\":true,\"llmCitationPrompt\":\"\"}}',40,'2026-09-23 13:16:38'),
('ai','{\"enableNvidia\":true,\"nvidiaModel\":\"meta/llama-3.2-11b-vision-instruct\",\"provider\":\"nvidia\"}',1,'2026-08-25 07:38:47'),
('ai_providers','{\"deepseek\":{\"model\":\"deepseek-chat\"},\"gemini\":{\"model\":\"gemini-2.0-flash\"},\"openai\":{\"model\":\"gpt-4o-mini\"},\"openrouter\":{\"model\":\"auto\",\"apiKey\":\"REDACTED_OPENROUTER_API_KEY\"},\"groq\":{\"model\":\"llama-3.3-70b-versatile\"},\"provider\":\"nvidia\",\"enableFallback\":true,\"_revision\":51,\"nvidia\":{\"apiKey\":\"REDACTED_NVIDIA_API_KEY\",\"enabled\":true,\"model\":\"nvidia/nemotron-3.5-bolt-e4b\",\"baseUrl\":\"https://integrate.api.nvidia.com/v1\"}}',51,'2026-11-17 07:23:13'),
('ai_quota','{\"premiumDailyLimit\":100,\"adminDailyLimit\":10000,\"updatedBy\":\"KoqvDHeXD1UqHHlProVXvn7MEoj2\",\"basicDailyLimit\":10,\"updatedAt\":{\"_seconds\":1787389070,\"_nanoseconds\":408000000}}',1,'2026-08-25 07:38:47'),
('feature_flags','{\"ENTERPRISE_TENANCY_ENABLED\":{\"changedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"changedAt\":{\"_seconds\":1787558541,\"_nanoseconds\":299000000},\"value\":true},\"CMS_SCHEDULER_ENABLED\":{\"value\":true,\"changedAt\":\"2026-08-29T01:52:44.948Z\",\"changedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"ENTERPRISE_OUTBOX_WORKER_ENABLED\":{\"value\":true,\"changedAt\":\"2026-08-29T01:52:56.308Z\",\"changedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"NOTIFICATION_OUTBOX_EXTERNAL_WORKER\":{\"value\":true,\"changedAt\":\"2026-08-29T01:53:00.724Z\",\"changedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"},\"PDF_RENDERER_ISOLATED\":{\"value\":true,\"changedAt\":\"2026-08-29T01:53:05.586Z\",\"changedBy\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\"}}',5,'2026-08-29 01:53:05'),
('general','{\"websiteName\":\"ResumePilot AI\",\"defaultLanguage\":\"en\",\"maintenanceMode\":false}',1,'2026-08-25 06:21:38'),
('maintenance','{\"scheduledEnd\":null,\"message\":\"Platform is undergoing scheduled maintenance.\",\"enabled\":false,\"updatedBy\":\"cert-superadmin@projectdemo.guru\",\"_revision\":4,\"updatedAt\":{\"_seconds\":1787483259,\"_nanoseconds\":134000000}}',1,'2026-08-25 07:38:47'),
('payment_providers','{\"_revision\": 0, \"phonepe\": {\"saltIndex\": \"1\"}, \"stripe\": {}, \"paytm\": {\"website\": \"WEBSTAGING\"}, \"paypal\": {\"environment\": \"sandbox\"}, \"razorpay\": {\"keyId\": \"rzp_test_TOnviD5XeHLE0y\", \"keySecret\": \"REDACTED_RAZORPAY_SECRET\"}}',1,'2026-08-29 01:33:34'),
('public_config','{\"modules\":{\"enablePublicSharingModule\":true,\"enableEmailVerification\":false,\"enableImportModule\":false,\"enableCouponsModule\":true,\"enableAiSuggestionsModule\":true,\"enableCoverLetterModule\":true,\"enableSalesTaxModule\":true,\"enableGoogleAuthModule\":true,\"enableAtsScoreModule\":true,\"enableGithubAuthModule\":false,\"enableGithubLogin\":false,\"enableLinkedinAuthModule\":false,\"enableLinkedinLogin\":false,\"enableFacebookAuthModule\":false,\"enablePortfolioModule\":false,\"enableJobScraperModule\":false,\"enableMessagesModule\":true,\"enableJobTrackerModule\":true,\"enableAppliedJobsModule\":true},\"auth\":{\"enableEmailVerification\":false},\"branding\":{\"brandName\":\"ResumePilot AI\",\"logoUrl\":\"\",\"darkLogoUrl\":\"\",\"faviconUrl\":\"\",\"defaultAvatarUrl\":\"\"},\"codeInjection\":{\"headerScripts\":\"\",\"footerScripts\":\"\"},\"exportPdf\":{\"renderTimeout\":60000,\"paperFormat\":\"A4\"},\"facebook\":{\"facebookAppId\":\"\",\"facebookPixelId\":\"\",\"enableFacebookLogin\":false},\"gdpr\":{\"enableCookieBanner\":true,\"cookieMessage\":\"We use cookies to improve your resume building experience and analyze website traffic.\",\"buttonText\":\"Accept All Cookies\",\"privacyPolicyUrl\":\"/p/privacy-policy\",\"termsOfServiceUrl\":\"/p/terms-of-service\"},\"geoSeo\":{\"enableGeoSeo\":true,\"targetRegion\":\"IN\",\"targetCity\":\"Bengaluru\",\"targetCountry\":\"India\",\"metaKeywords\":\"AI Resume Builder India, Free CV Maker, Biodata Format, Naukri Resume, Professional CV Bengaluru\",\"canonicalUrl\":\"\",\"enableJobPostingSchema\":true,\"enableOrganizationSchema\":true},\"google\":{\"enableGoogleLogin\":true},\"integrations\":{\"googleMapsApiKey\":\"\",\"recaptchaSiteKey\":\"\",\"gaMeasurementId\":\"\",\"facebookPixelId\":\"\"},\"jobScraper\":{\"keywords\":\"web developer\",\"location\":\"India\",\"maxJobs\":25,\"scrapeIntervalHours\":24},\"llmGeo\":{\"enableLlmGeo\":true,\"aiModelOptimization\":\"ChatGPT, Perplexity, Gemini, Claude\",\"llmsTxtContent\":\"# ResumePilot AI > Browser-based resume and career-document application.  Website: https://airesume.projectdemo.guru  ## Product scope - Guided resume and cover-letter editing - Registered resume and cover-letter layouts - Resume preview and supported export workflows - Optional AI-assisted writing and job tools when enabled by an operator - Firebase Authentication for identity and MariaDB for application data  ## Accuracy note Features, payment providers, pricing, and regional availability depend on current runtime configuration. Consult the website for current details. This document does not assert rankings, ratings, employment outcomes, or crawler endorsement.\",\"allowGptBot\":true,\"allowClaudeBot\":true,\"allowGeminiBot\":true,\"llmCitationPrompt\":\"\"},\"security\":{\"maxUploadSizeMb\":5,\"allowedExtensions\":\".png,.jpg,.jpeg,.pdf,.doc,.docx\",\"sessionTimeoutMinutes\":60,\"rateLimitRequests\":100},\"social\":{\"facebook\":\"\",\"twitter\":\"\",\"instagram\":\"\",\"youtube\":\"\",\"pinterest\":\"\"},\"socialAuth\":{\"enableGoogleLogin\":true,\"enableFacebookLogin\":false,\"linkedinClientId\":\"\",\"enableLinkedinLogin\":false,\"githubClientId\":\"\",\"enableGithubLogin\":false},\"templateManager\":{\"disabledCvTemplates\":[],\"proCvTemplates\":[\"Cv1\",\"Cv2\",\"Cv5\"],\"disabledCoverTemplates\":[]},\"watermark\":{\"enableFreeWatermark\":true,\"watermarkText\":\"Created with ResumePilot AI (Free Plan)\",\"opacity\":0.2,\"position\":\"diagonal\"},\"subscriptions\":{\"state\":false,\"stripeEnabled\":false,\"paypalEnabled\":false,\"razorpayEnabled\":false,\"paytmEnabled\":false,\"phonepeEnabled\":false,\"sandboxMode\":true,\"enableTax\":true,\"taxName\":\"GST\",\"taxRate\":18,\"taxInclusive\":false,\"currency\":\"INR\",\"monthlyPrice\":199,\"quartarlyPrice\":399,\"yearlyPrice\":499},\"systemHealth\":{\"maintenanceMode\":false,\"maintenanceMessage\":\"Scheduled maintenance is in progress.\"},\"currency\":\"INR\",\"currencySymbol\":\"₹\",\"allowMultiCurrency\":false,\"_settingsRevisions\":{\"modules\":40,\"auth\":0,\"branding\":0,\"codeInjection\":0,\"exportPdf\":0,\"facebook\":0,\"gdpr\":0,\"geoSeo\":0,\"google\":0,\"integrations\":0,\"jobScraper\":0,\"llmGeo\":1,\"security\":0,\"social\":0,\"socialAuth\":0,\"templateManager\":0,\"watermark\":0,\"payments\":0,\"systemHealth\":0},\"ai\":{\"provider\":\"nvidia\",\"temperature\":0.7,\"maxTokens\":2048,\"enableFallback\":true,\"enableImportModule\":false,\"enableNvidia\":true,\"nvidiaModel\":\"nvidia/nemotron-3.5-bolt-e4b\",\"enableGemini\":false,\"model\":\"gemini-2.0-flash\",\"enableOpenai\":false,\"openaiModel\":\"gpt-4o-mini\",\"enableGroq\":false,\"groqModel\":\"llama-3.3-70b-versatile\",\"enableOpenrouter\":true,\"openrouterModel\":\"auto\",\"enableDeepseek\":false,\"deepseekModel\":\"deepseek-chat\"},\"aiRevision\":51}',51,'2026-11-17 07:23:13'),
('seo','{\"metaTitle\":\"ResumePilot AI — #1 AI Resume & CV Builder\",\"metaDescription\":\"Build high-scoring ATS resumes with AI.\"}',1,'2026-08-25 06:21:38'),
('system_ping_check','{\"lastPing\":{\"_seconds\":1787642994,\"_nanoseconds\":383000000}}',1,'2026-08-25 07:38:47'),
('system_settings','{\"currency\":\"INR\",\"currencyRevision\":0,\"allowMultiCurrency\":false}',0,'2026-08-29 01:33:34'),
('theme','{\"primaryColor\":\"#2563EB\",\"darkMode\":true}',1,'2026-08-25 06:21:38'),
('website_meta','{\"title\":\"ResumePilot AI — Resume Builder & CV Maker\",\"description\":\"Create and edit resumes, cover letters, and professional portfolios with guided tools, configurable layouts, previews, and export options.\",\"keywords\":\"ResumePilot AI, resume builder, CV maker, cover letter builder, portfolio builder, resume templates\",\"language\":\"English\",\"disabledLanguages\":[\"German\",\"Spanish\",\"Italian\",\"Dutch\",\"Norwegian\",\"Greek\",\"Icelandic\",\"Swedish\",\"Russian\",\"French\",\"Portuguese\",\"Polish\",\"Danish\",\"Romanian\"],\"trackingCode\":\"\",\"revision\":3,\"updatedAt\":\"2026-08-29T12:27:42.334Z\"}',3,'2026-08-29 12:27:42');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `txn_id` varchar(128) NOT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_type` varchar(64) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `subtotal` int(11) DEFAULT 0,
  `tax_amount` int(11) DEFAULT 0,
  `tax_rate` int(11) DEFAULT 18,
  `tax_name` varchar(64) DEFAULT 'GST',
  `company_tax_id` varchar(64) DEFAULT NULL,
  `customer_tax_id` varchar(64) DEFAULT NULL,
  `currency` varchar(10) DEFAULT 'INR',
  `status` varchar(50) DEFAULT 'Completed',
  `duration_months` int(11) DEFAULT 12,
  `created_date_string` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_txn_user` (`user_id`),
  KEY `idx_txn_code` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `trusted_by`
--

DROP TABLE IF EXISTS `trusted_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trusted_by` (
  `id` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo_url` varchar(1024) DEFAULT NULL,
  `website_url` varchar(1024) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_tb_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_by`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `trusted_by` WRITE;
/*!40000 ALTER TABLE `trusted_by` DISABLE KEYS */;
INSERT INTO `trusted_by` VALUES
('tb_amazon','Amazon','https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg',NULL,3,1,'2026-08-25 06:21:38','2026-08-25 06:21:38',1),
('tb_google','Google','https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg',NULL,1,1,'2026-08-25 06:21:38','2026-08-25 06:21:38',1),
('tb_microsoft','Microsoft','https://upload.wikimedia.org/wikipedia/commons/9/96/Microsoft_logo_%282012%29.svg',NULL,2,1,'2026-08-25 06:21:38','2026-08-25 06:21:38',1);
/*!40000 ALTER TABLE `trusted_by` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(120) DEFAULT NULL,
  `lastname` varchar(120) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `photoUrl` varchar(1024) DEFAULT NULL,
  `avatarUrl` varchar(1024) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `jobTitle` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `membership` varchar(50) DEFAULT 'Basic',
  `membershipEnds` varchar(64) DEFAULT NULL,
  `paymentStatus` varchar(50) DEFAULT 'INACTIVE',
  `lastPaymentGateway` varchar(64) DEFAULT NULL,
  `lastPaymentOrderId` varchar(128) DEFAULT NULL,
  `lastPaymentAmount` int(11) DEFAULT 0,
  `lastPaymentCurrency` varchar(10) DEFAULT 'INR',
  `lastPaymentDate` timestamp NULL DEFAULT NULL,
  `cancellationRequested` tinyint(1) DEFAULT 0,
  `suspended` tinyint(1) DEFAULT 0,
  `role` varchar(50) DEFAULT 'USER',
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_data`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revision` int(11) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_email` (`email`),
  KEY `idx_user_role` (`role`),
  KEY `idx_user_membership` (`membership`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
('OhZdiSIFL7ePA1TMkfu9bnR935D3','bhaskar.beyond@gmail.com','Bhaskar','Beyond (Super Admin)','Bhaskar Beyond',NULL,NULL,NULL,NULL,NULL,'Visakhapatnam','India',NULL,'Premium','2027-11-17T08:21:00.539Z','ADMIN_GRANTED',NULL,NULL,0,'INR',NULL,0,0,'SUPER_ADMIN','{\"userId\":\"OhZdiSIFL7ePA1TMkfu9bnR935D3\",\"photoURL\":\"https://lh3.googleusercontent.com/a/ACg8ocLLvA0bNSaGztQRdqzrhlhDa5_Jl6S7GGuD-9ZosF5DEQmjLA=s96-c\",\"authProvider\":\"password\",\"name\":\"Bhaskar Beyond (Super Admin)\",\"address\":\"\",\"postalCode\":\"530013\",\"postalcode\":\"530013\",\"occupation\":\"Frontend Web Developer\",\"linkedinUrl\":\"\",\"githubUrl\":\"\",\"websiteUrl\":\"\",\"summary\":\"HR Recruiter with 2+ years of experience in candidate sourcing, interview scheduling, and offer negotiation. Proficient in Applicant Tracking Systems (ATS), diversity recruitment, and social media recruiting, with certifications including SHRM-CP and Certified Internet Recruiter (CIR).\",\"workExperiences\":[{\"id\":\"job_1788247741824\",\"jobTitle\":\"\",\"company\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"• completed html css making websites\"}],\"education\":[{\"id\":\"edu_1792396803655\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\"},{\"id\":\"edu_1794899055428\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\"},{\"id\":\"edu_1794899057392\",\"degree\":\"\",\"school\":\"\",\"city\":\"\",\"startDate\":\"\",\"endDate\":\"\",\"description\":\"\"}],\"skills\":[],\"languages\":[],\"certifications\":[],\"projects\":[{\"id\":\"proj_1788287181996\",\"title\":\"Talent Acquisition\",\"role\":\"\",\"technologies\":\"\",\"projectType\":\"personal\",\"description\":\"Test\",\"link\":\"\",\"url\":\"\"}],\"hobbies\":[\"Photography\",\"Reading\",\"Hiking\",\"Cooking\",\"Traveling\",\"Volunteering\"],\"selectedImage\":null,\"achievements\":[{\"id\":\"ach_1792397138509\",\"title\":\"\",\"name\":\"\",\"issuer\":\"\",\"awarder\":\"\",\"date\":\"\",\"description\":\"\",\"achievementType\":\"Milestone\"}],\"references\":[{\"id\":\"ref_1792397157082\",\"name\":\"Pallavi B\",\"position\":\"CEO\",\"company\":\"Beyond Technologies\",\"email\":\"pallavi@bynd.co.in\",\"phone\":\"+919885220009\",\"reference\":\"\",\"description\":\"\"}],\"customSections\":[],\"aiQuotaLastResetAt\":\"2026-11-17T08:37:19.996Z\",\"lastPaymentAmount\":0,\"lastPaymentCurrency\":\"INR\",\"lastPaymentDate\":null,\"cancellationRequested\":false,\"created_at\":\"2026-08-25T07:37:24.000Z\",\"updated_at\":\"2026-11-17T08:18:22.000Z\",\"deleted_at\":null,\"createdAt\":\"2026-08-25T07:37:24.000Z\",\"updatedAt\":\"2026-11-17T08:18:22.000Z\",\"deletedAt\":null,\"aiQuotaOverride\":{\"dailyLimit\":1000,\"expiresAt\":null,\"reason\":\"Client meeting elevation to 1000/day\",\"setAt\":\"2026-11-17T08:37:19.995Z\"}}','2026-08-25 07:37:24','2026-11-23 14:46:33',368,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-23 18:33:20
