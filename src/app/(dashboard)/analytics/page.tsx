import { DashboardHeader } from '@/components/dashboard/header'
import { DashboardShell } from '@/components/dashboard/shell'
import { AnalyticsOverview } from '@/components/analytics/overview'

export default function AnalyticsPage() {
  return (
    <DashboardShell>
      <DashboardHeader
        heading="Analytics"
        text="Visualiza las métricas de tu aplicación"
      />
      <AnalyticsOverview />
    </DashboardShell>
  )
}