-- RLS Policies for profiles
DROP POLICY IF EXISTS "Users can view own profiles" ON profiles;
DROP POLICY IF EXISTS "Users can insert own profiles" ON profiles;
DROP POLICY IF EXISTS "Users can update own profiles" ON profiles;
DROP POLICY IF EXISTS "Users can delete own profiles" ON profiles;

CREATE POLICY "Users can view own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

-- RLS Policies for organizations
DROP POLICY IF EXISTS "Users can view own organizations" ON organizations;
DROP POLICY IF EXISTS "Users can insert own organizations" ON organizations;
DROP POLICY IF EXISTS "Users can update own organizations" ON organizations;
DROP POLICY IF EXISTS "Users can delete own organizations" ON organizations;

-- RLS Policies for org_members
DROP POLICY IF EXISTS "Users can view own org_members" ON org_members;
DROP POLICY IF EXISTS "Users can insert own org_members" ON org_members;
DROP POLICY IF EXISTS "Users can update own org_members" ON org_members;
DROP POLICY IF EXISTS "Users can delete own org_members" ON org_members;

CREATE POLICY "Users can view org org_members" ON org_members
  FOR SELECT USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
    )
  );

CREATE POLICY "Users can insert org org_members" ON org_members
  FOR INSERT WITH CHECK (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

CREATE POLICY "Users can update org org_members" ON org_members
  FOR UPDATE USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

-- RLS Policies for subscriptions
DROP POLICY IF EXISTS "Users can view own subscriptions" ON subscriptions;
DROP POLICY IF EXISTS "Users can insert own subscriptions" ON subscriptions;
DROP POLICY IF EXISTS "Users can update own subscriptions" ON subscriptions;
DROP POLICY IF EXISTS "Users can delete own subscriptions" ON subscriptions;

CREATE POLICY "Users can view org subscriptions" ON subscriptions
  FOR SELECT USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
    )
  );

CREATE POLICY "Users can insert org subscriptions" ON subscriptions
  FOR INSERT WITH CHECK (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

CREATE POLICY "Users can update org subscriptions" ON subscriptions
  FOR UPDATE USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

-- RLS Policies for usage_metrics
DROP POLICY IF EXISTS "Users can view own usage_metrics" ON usage_metrics;
DROP POLICY IF EXISTS "Users can insert own usage_metrics" ON usage_metrics;
DROP POLICY IF EXISTS "Users can update own usage_metrics" ON usage_metrics;
DROP POLICY IF EXISTS "Users can delete own usage_metrics" ON usage_metrics;

CREATE POLICY "Users can view org usage_metrics" ON usage_metrics
  FOR SELECT USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
    )
  );

CREATE POLICY "Users can insert org usage_metrics" ON usage_metrics
  FOR INSERT WITH CHECK (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

CREATE POLICY "Users can update org usage_metrics" ON usage_metrics
  FOR UPDATE USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

-- RLS Policies for audit_logs
DROP POLICY IF EXISTS "Users can view own audit_logs" ON audit_logs;
DROP POLICY IF EXISTS "Users can insert own audit_logs" ON audit_logs;
DROP POLICY IF EXISTS "Users can update own audit_logs" ON audit_logs;
DROP POLICY IF EXISTS "Users can delete own audit_logs" ON audit_logs;

CREATE POLICY "Users can view org audit_logs" ON audit_logs
  FOR SELECT USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
    )
  );

CREATE POLICY "Users can insert org audit_logs" ON audit_logs
  FOR INSERT WITH CHECK (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

CREATE POLICY "Users can update org audit_logs" ON audit_logs
  FOR UPDATE USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

-- RLS Policies for projects
DROP POLICY IF EXISTS "Users can view own projects" ON projects;
DROP POLICY IF EXISTS "Users can insert own projects" ON projects;
DROP POLICY IF EXISTS "Users can update own projects" ON projects;
DROP POLICY IF EXISTS "Users can delete own projects" ON projects;

CREATE POLICY "Users can view org projects" ON projects
  FOR SELECT USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
    )
  );

CREATE POLICY "Users can insert org projects" ON projects
  FOR INSERT WITH CHECK (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

CREATE POLICY "Users can update org projects" ON projects
  FOR UPDATE USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

-- RLS Policies for api_keys
DROP POLICY IF EXISTS "Users can view own api_keys" ON api_keys;
DROP POLICY IF EXISTS "Users can insert own api_keys" ON api_keys;
DROP POLICY IF EXISTS "Users can update own api_keys" ON api_keys;
DROP POLICY IF EXISTS "Users can delete own api_keys" ON api_keys;

CREATE POLICY "Users can view org api_keys" ON api_keys
  FOR SELECT USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
    )
  );

CREATE POLICY "Users can insert org api_keys" ON api_keys
  FOR INSERT WITH CHECK (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );

CREATE POLICY "Users can update org api_keys" ON api_keys
  FOR UPDATE USING (
    organization_id IN (
      SELECT organization_id FROM org_members
      WHERE user_id = auth.uid() AND status = 'active'
        AND role IN ('owner', 'admin')
    )
  );
